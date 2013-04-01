class Location < ActiveRecord::Base
  attr_accessible :name, :photos_attributes, :description, :events_ids
  has_many :photos, dependent: :destroy, inverse_of: :location
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :events

  has_paper_trail
end
