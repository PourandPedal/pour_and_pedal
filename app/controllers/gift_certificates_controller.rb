class GiftCertificatesController < ApplicationController

  expose(:gift_certificate)
  expose(:client)

  # def new
  #   @client = gift_certificate.client.build
  # end

  def create
    client = Client.create(params[:client])
    session[:client_id] = client.id
    gift_certificate.client_id = client.id
    if gift_certificate.save
      session[:gift_certificate_id] = gift_certificate.id
      redirect_to gift_certificate_confirmation_path
    else
      render :new
    end
  end

  def gift_certificate_confirmation
    @cert = GiftCertificate.find(session[:gift_certificate_id])
    session[:price] = @cert.number_purchased * 125
  end

  # def gift_certificates_charge
  # end
    # cert.

  # def gift_certificate_charge

  #   @amount = (@this_trip_price * 100)
  #   @amount = @amount.to_i


  #     customer = Stripe::Customer.create(
  #       :email => @newclient.email,
  #       :card  => params[:stripeToken]
  #     )

  #     charge = Stripe::Charge.create(
  #       :customer    => customer.id,
  #       :amount      => @amount,
  #       :description => @trip.event.title,
  #       :currency    => 'usd'
  #     )

  #     @newclient.stripe_id = customer.id
  #     @newclient.trip_id = @trip.id
  #     @newclient.amount_paid = (@amount/100)
  #     @newclient.tickets_purchased = @quantity
  #     @newclient.date_paid = Date.today
  #     @newclient.save
  #     @confirmation_number = generate_confirmation_number(@trip, @newclient)
  #     confirmation_create(@confirmation_number, @newclient, @trip, @quantity)
  #     used_code if session[:redemption_code].present?

  #     NotificationMailer.booking_notification(@trip).deliver
  #     NotificationMailer.booking_confirmation(@trip, @newclient).deliver unless @newclient.email.blank?
  #   end

  #   rescue Stripe::CardError => e
  #     flash[:error] = e.message
  #     redirect_to charges_path
  # end
  # end
end
