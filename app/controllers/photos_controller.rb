class PhotosController < ApplicationController

  expose(:gallery_images)
  expose(:gallery_image)

  def index
    prepare_for_mobile
    if mobile_device?
      redirect_to mobile_gallery_path
    else
      render layout: 'gallery'
    end
  end

  def mobile_gallery
    render layout: 'gallery'
  end

  private

    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS|iPhone/
      end
    end
    helper_method :mobile_device?

    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
    end
end
