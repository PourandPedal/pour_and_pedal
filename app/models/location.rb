class Location < ActiveRecord::Base
  attr_accessible :name, :photos_attributes, :description
  has_many :photos, dependent: :destroy, inverse_of: :location
  accepts_nested_attributes_for :photos, allow_destroy: true
end
