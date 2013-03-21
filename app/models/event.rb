class Event < ActiveRecord::Base
  attr_accessible :date, :description, :price,
                  :title, :spots_available, :tickets_sold, :location,
                  :directions, :location_id

  # before_save :update_spots_available
  has_many :confirmations
  has_many :clients, through: :confirmations
  belongs_to :location

  # def update_spots_available
  #   if self.spots_available
  #     self.spots_available = self.spots_available - self.tickets_sold
  #   else
  #   end
  # end

end
