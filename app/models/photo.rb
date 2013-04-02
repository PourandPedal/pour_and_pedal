class Photo < ActiveRecord::Base
  attr_accessible :location_id, :photo, :photo_cache,
                  :remove_photo, :title, :event_ids, :primary_for_location,
                  :primary_for_event
  belongs_to :location, inverse_of: :photos
  has_and_belongs_to_many :events
  mount_uploader :photo, PhotoUploader

  validates_presence_of :title, :photo

  has_paper_trail

  before_save :set_primary

  def set_primary
    if self.primary_for_location?
      current_primary = self
      if self.locations[0].id
        location_id = self.locations[0].id
        photos = Photo.where(location_id: location_id, primary_for_location: true)
      else
      end
        photos.each do |photo|
          if photo == current_primary
          else
            photo.primary_for_location = false
            photo.save
          end
        end
    elsif self.primary_for_event?
      current_primary = self
      if self.events[0].id
        event_id = self.events[0].id
        photos = Photo.where(event_id: event_id, is_primary: true)
      else
      end
        photos.each do |photo|
          if photo == current_primary
          else
            photo.primary_for_event = false
            photo.save
          end
        end
    end
  end
end
