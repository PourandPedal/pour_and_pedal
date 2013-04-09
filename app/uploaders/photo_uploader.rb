class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #to use in views, just use model_name.photo.small to render the small version

  # simply add more versions using the following template

  version :thumb do
    process :resize_to_fill => [50, 50]
    # can use :resize_to_limit instead of :resize_to_fill if you don't want the
    # image proportions changed
  end

  version :small do
    process :resize_to_fill => [100, 100]
    # can use :resize_to_limit instead of :resize_to_fill if you don't want the
    # image proportions changed
  end

  version :homepage do
    process :resize_to_limit => [710, 355]
  end

  version :medium do
    process :resize_to_fill => [235, 125]
  end

  version :large do
    process :resize_to_fill => [470, 250]
  end

  version :gallery do
    process :resize_to_limit => [800, 600]
  end

  version :headline do
    process :resize_to_fill => [940, 264]
  end

  def extension_white_list
    %w(jpg jpeg gif png tiff)
  end

end