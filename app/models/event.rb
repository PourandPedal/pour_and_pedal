class Event < ActiveRecord::Base
  attr_accessible :date, :description, :price,
                  :title, :spots_available, :tickets_sold, :location,
                  :directions, :location_id, :photos_attributes

  has_many :confirmations
  has_many :clients, through: :confirmations
  belongs_to :location

  has_many :photos, dependent: :destroy, inverse_of: :event
  accepts_nested_attributes_for :photos, allow_destroy: true

end
