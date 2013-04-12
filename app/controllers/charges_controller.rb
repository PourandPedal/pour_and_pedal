class ChargesController < ApplicationController

  def requesting
    @trip = Trip.find(params[:trip_id])
  end

  def gift_certificate_charge
    @cert = GiftCertificate.find(session[:gift_certificate_id])
    @client = Client.find(session[:client_id])
    @amount = (@cert.number_purchased * 125 * 100)
    @amount = @amount.to_i


    customer = Stripe::Customer.create(
      :email => @client.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Gift Certificate",
      :currency    => 'usd'
    )

    @client.stripe_id = customer.id
    @client.amount_paid = (@amount/100)
    @client.gifts_purchased = @cert.number_purchased
    @client.date_paid = Date.today
    @cert.date_purchased = Date.today
    @client.save
    @confirmation_number = (rand(1000000) + 2013).to_s + "gift" + @client.id.to_s
    confirm = Confirmation.create!(confirmation_number: @confirmation_number,
      client_id: @client.id, is_used: false, is_expired: false, source: "Website",
      created_by: "Client", value: @client.amount_paid, gift_certificate_id: @cert.id)
    @cert.confirmation_id = confirm.id
    @cert.price_paid = @client.amount_paid
    @cert.save

    # NotificationMailer.booking_notification(@trip).deliver
    # NotificationMailer.booking_confirmation(@trip, @newclient).deliver unless @newclient.email.blank?

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to gift_certificate_charge_path
  end

  def new
    session[:redemption_code_is_used] = nil
    session[:code_not_found] = nil
    session[:trip_price] = nil
    @trip = Trip.find(params[:trip_id])
    @quantity = params[:quantity].to_i
    session[:quantity] = @quantity
    session[:trip_id] = @trip.id
    new_client
    session[:trip_price] = @trip.price * @quantity
    using_redemption_code(params[:redemption_code]) if params[:redemption_code].present?
  end

  def new_client
    first_name = params[:first_name]
    last_name = params[:last_name]
    zip = params[:zipcode]
    phone = params[:phone]
    email = params[:email]
    @newclient = Client.new(first_name: first_name, last_name: last_name,
      zipcode: zip, phone: phone, email: email)
    @newclient.save
    session[:new_client_id] = @newclient.id
  end

  def new_gift_recipient_client
    first_name = params[:giver_first_name]
    last_name = params[:giver_last_name]
    zip = params[:giver_zipcode]
    email = params[:giver_email]
    @newclient = Client.new(first_name: first_name, last_name: last_name,
      zipcode: zip, email: email)
    @newclient.save
    session[:new_client_id] = @newclient.id
  end

  def using_redemption_code(redemption_code)
    @redemption_code = Confirmation.find_by_confirmation_number(redemption_code)
    if @redemption_code && !@redemption_code.is_used?
      check_redemption_code_validity(@redemption_code)


      set_trip_price_with_code
      session[:redemption_code] = @redemption_code.id
    elsif @redemption_code && @redemption_code.is_used?
      session[:redemption_code_is_used] = true
    else
      session[:code_not_found] = true
    end
  end

  def check_redemption_code_validity(redemption_code)
    if redemption_code.expiration_date < Date.today
      redemption_code.is_expired = true
      redemption_code.save
    else
    end
  end

  def set_trip_price_with_code
    session[:trip_quantity] = (session[:quantity] - @redemption_code.number_of_tickets) unless
    @redemption_code.is_expired? || @redemption_code.is_used? ||
    @redemption_code.is_cancelled?
    session[:trip_price] = session[:trip_quantity] * @trip.price
  end

  def create
    @trip = Trip.find(session[:trip_id])
    @quantity = session[:quantity]
    if session[:trip_quantity] && (session[:trip_quantity] > 0)
      @trip_quantity = session[:trip_quantity]
      @this_trip_price = @trip.price * (@quantity - @trip_quantity)
    else
      @this_trip_price = session[:trip_price]
    end
    if @this_trip_price && @this_trip_price <= 0
      create_with_no_balance_due
    else
      @newclient = Client.find(session[:new_client_id])

      # Amount in cents
      @amount = (@this_trip_price * 100)
      @amount = @amount.to_i

      customer = Stripe::Customer.create(
        :email => @newclient.email,
        :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @trip.event.title,
        :currency    => 'usd'
      )

      @newclient.stripe_id = customer.id
      @newclient.trip_id = @trip.id
      @newclient.amount_paid = (@amount/100)
      @newclient.tickets_purchased = @quantity
      @newclient.date_paid = Date.today
      @newclient.save
      @confirmation_number = generate_confirmation_number(@trip, @newclient)
      confirmation_create(@confirmation_number, @newclient, @trip, @quantity)
      used_code if session[:redemption_code].present?

      NotificationMailer.booking_notification(@trip).deliver
      NotificationMailer.booking_confirmation(@trip, @newclient).deliver unless @newclient.email.blank?
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end


  def create_with_no_balance_due
    @newclient = Client.find(session[:new_client_id])
    @trip = Trip.find(session[:trip_id])
    @quantity = session[:quantity]

    @newclient.stripe_id = 'none'
    @newclient.trip_id = @trip.id
    @newclient.amount_paid = 0
    @newclient.tickets_purchased = @quantity
    @newclient.date_paid = Date.today
    @newclient.save
    @confirmation_number = generate_confirmation_number(@trip, @newclient)

    confirmation_create(@confirmation_number, @newclient, @trip, @quantity)
    used_code if session[:redemption_code].present?


    NotificationMailer.booking_notification(@trip).deliver
    NotificationMailer.booking_confirmation(@trip, @newclient).deliver
  end

  def confirmation_create(confirmation, client, trip, quantity)
    Confirmation.create!(confirmation_number: confirmation,
      client_id: client.id, is_used: false, is_expired: false, source: "Website",
      created_by: "Client", value: client.amount_paid, trip_id: trip.id,
      number_of_tickets: @quantity)

    trip.tickets_sold = 0 unless trip.tickets_sold
    trip.update_attributes(tickets_sold: (trip.tickets_sold + quantity))
    @trip.update_attributes(spots_available: (trip.spots_available -
                              quantity))
    session[:event_price] = nil
  end

  def used_code
    used_code = Confirmation.find(session[:redemption_code])
    used_code.is_used = true
    used_code.redeemed_on = Date.today
    used_code.client_id = @newclient.id
    used_code.trip_id = @trip.id
    used_code.save
    end

  def generate_confirmation_number(trip, client)
    confirmation_number = (rand(1000000) + 2013).to_s + "t" + trip.id.to_s +
                          "c" + client.id.to_s
  end


end
