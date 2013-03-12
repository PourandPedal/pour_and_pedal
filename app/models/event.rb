class Event < ActiveRecord::Base
  attr_accessible :date, :description, :price,
                  :title, :spots_available, :tickets_sold

  before_save :update_spots_available

  def update_spots_available
    if self.spots_available
      self.spots_available = self.spots_available - self.tickets_sold
    else
    end
  end

end
