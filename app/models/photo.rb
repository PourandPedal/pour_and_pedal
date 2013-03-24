class Photo < ActiveRecord::Base
  attr_accessible :is_primary, :location_id, :photo, :photo_cache, :remove_photo
  belongs_to :location, inverse_of: :photos
  belongs_to :event, inverse_of: :photos
  mount_uploader :photo, PhotoUploader

  before_save :set_primary

  def set_primary
    if self.is_primary?
      current_primary = self
      if self.event_id
        photos = Photo.where(location_id: self.location_id, event_id: self.event_id, is_primary: true)
      else
        photos = Photo.where(location_id: self.location_id, is_primary: true)
      end
        photos.each do |photo|
          if photo == current_primary
          else
            photo.is_primary = false
            photo.save
          end
        end
    else
    end
  end
end
