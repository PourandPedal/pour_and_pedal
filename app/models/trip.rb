class Trip < ActiveRecord::Base
  attr_accessible :date, :event_id, :price, :spots_available, :tickets_sold, :title

  has_many :confirmations
  has_many :clients, through: :confirmations
  belongs_to :event, inverse_of: :trips
  has_paper_trail
end
