class GalleryImage < ActiveRecord::Base
  attr_accessible :caption, :photo, :title, :photo_cache,
                  :remove_photo
  mount_uploader :photo, PhotoUploader

  validates_presence_of :title, :photo, :caption

  has_paper_trail

end
