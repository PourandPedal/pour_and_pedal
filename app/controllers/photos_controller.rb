class PhotosController < ApplicationController

  expose(:photo)
  expose(:photos) { Photo.where(in_gallery: true) }

end
