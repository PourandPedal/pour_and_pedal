class GiftCertificatesController < ApplicationController

  expose(:gift_certificate)
  expose(:client)

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

end
