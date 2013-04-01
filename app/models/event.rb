class Event < ActiveRecord::Base
  attr_accessible :date, :description,
                  :title, :location,
                  :directions, :location_id, :photo_ids, :trips_attributes

  belongs_to :location

  has_and_belongs_to_many :photos
  has_many :trips, dependent: :destroy, inverse_of: :event
  accepts_nested_attributes_for :trips, allow_destroy: true

  has_paper_trail

end
