class PhotosController < ApplicationController

  expose(:gallery_images)
  expose(:gallery_image)

  def index
    render layout: 'gallery'
  end

end
