class Photo < ActiveRecord::Base
  attr_accessible :is_primary, :location_id, :photo, :photo_cache, :remove_photo
  belongs_to :location, inverse_of: :photos
  belongs_to :event, inverse_of: :photos
  mount_uploader :photo, PhotoUploader
end
