class HomeImage < ActiveRecord::Base
  attr_accessible :photo, :position, :title, :photo_cache,
                  :remove_photo

  mount_uploader :photo, PhotoUploader

  validates_presence_of :title, :photo
  validates_uniqueness_of :position

  has_paper_trail
end
