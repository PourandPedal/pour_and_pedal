class ChargesController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @quantity = params[:quantity].to_i
    session[:quantity] = @quantity
    new_client
    session[:event] = @event
  end

  def create
    @newclient = session[:new_client]
    @event = session[:event]
    @quantity = session[:quantity]

    # Amount in cents
    @amount = (@event.price * 100 * @quantity)
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
    @newclient.save
    @confirmation_number = generate_confirmation_number(@event, @newclient)

    Confirmation.create!(confirmation_number: @confirmation_number,
      client_id: @newclient.id, is_used: false, is_expired: false, source: "Website",
      created_by: "Client", value: @newclient.amount_paid, event_id: @event.id)

    @event.update_attributes(tickets_sold: (@event.tickets_sold + @quantity))
    @event.update_attributes(spots_available: (@event.spots_available -
                              @quantity))

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path

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
