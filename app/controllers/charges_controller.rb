class ChargesController < ApplicationController

  def new
    session[:code_not_found] = nil
    @event = Event.find(params[:event_id])
    @quantity = params[:quantity].to_i
    session[:quantity] = @quantity
    new_client
    session[:event] = @event.id

    if !params[:redemption_code].blank?
      @redemption_code = Confirmation.find_by_confirmation_number(params[:redemption_code])
      if @redemption_code
        check_redemption_code_validity(@redemption_code)
        set_event_price_with_code
        session[:redemption_code] = @redemption_code.id
      else
        session[:code_not_found] = true
        session[:event_price] = @event.price
      end
    else
      session[:event_price] = @event.price
    end
  end

  def set_event_price_with_code
    if @redemption_code.is_expired?
      session[:event_price] = @event.price
    else
      session[:event_price] = (@event.price - @redemption_code.value)
    end
  end

  def check_redemption_code_validity(redemption_code)
    if redemption_code.expiration_date < Date.today
      redemption_code.is_expired = true
      redemption_code.save
    else
    end
  end

  def create
    if session[:event_price] && session[:event_price] <= 0
      create_with_no_balance_due
    else
      @this_event_price = session[:event_price]
      @newclient = session[:new_client]
      @event = Event.find(session[:event])
      @quantity = session[:quantity]

      # Amount in cents
      @amount = (@this_event_price * 100 * @quantity)
      @amount = @amount.to_i


      customer = Stripe::Customer.create(
        :email => @newclient.email,
        :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @event.title,
        :currency    => 'usd'
      )

      @newclient.stripe_id = customer.id
      @newclient.event_id = @event.id
      @newclient.amount_paid = (@amount/100)
      @newclient.tickets_purchased = @quantity
      @newclient.date_paid = Date.today
      @newclient.save
      @confirmation_number = generate_confirmation_number(@event, @newclient)

      Confirmation.create!(confirmation_number: @confirmation_number,
        client_id: @newclient.id, is_used: false, is_expired: false, source: "Website",
        created_by: "Client", value: @newclient.amount_paid, event_id: @event.id)
      @event.tickets_sold = 0 unless @event.tickets_sold
      @event.update_attributes(tickets_sold: (@event.tickets_sold + @quantity))
      @event.update_attributes(spots_available: (@event.spots_available -
                                @quantity))
      session[:event_price] = nil
      NotificationMailer.booking_notification(@event).deliver
      NotificationMailer.booking_confirmation(@event, @newclient).deliver
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  def create_with_no_balance_due
    @newclient = session[:new_client]
    @event = Event.find(session[:event])
    @quantity = session[:quantity]

    @newclient.stripe_id = 'none'
    @newclient.event_id = @event.id
    @newclient.amount_paid = 0
    @newclient.tickets_purchased = @quantity
    @newclient.date_paid = Date.today
    @newclient.save
    @confirmation_number = generate_confirmation_number(@event, @newclient)

    Confirmation.create!(confirmation_number: @confirmation_number,
      client_id: @newclient.id, is_used: false, is_expired: false, source: "Website",
      created_by: "Client", value: @newclient.amount_paid, event_id: @event.id)

    @event.tickets_sold = 0 unless @event.tickets_sold
    @event.update_attributes(tickets_sold: (@event.tickets_sold + @quantity))
    @event.update_attributes(spots_available: (@event.spots_available -
                              @quantity))
    used_code = Confirmation.find(session[:redemption_code])
    used_code.is_used = true
    used_code.redeemed_on = Date.today
    used_code.client_id = @newclient.id
    used_code.event_id = @event.id
    used_code.save

    NotificationMailer.booking_notification(@event).deliver
    NotificationMailer.booking_confirmation(@event, @newclient).deliver

    session[:event_price] = nil

  end

  def new_client
    first_name = params[:first_name]
    last_name = params[:last_name]
    zip = params[:zipcode]
    phone = params[:phone]
    email = params[:email]
    @newclient = Client.new(first_name: first_name, last_name: last_name,
      zipcode: zip, phone: phone, email: email)
    session[:new_client] = @newclient
  end

  def generate_confirmation_number(event, client)
    confirmation_number = (rand(1000000) + 2013).to_s + "e" + event.id.to_s +
                          "c" + client.id.to_s
  end
end
