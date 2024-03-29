class Trip < ActiveRecord::Base
  attr_accessible :date, :event_id, :price, :spots_available, :tickets_sold, :title

  has_many :confirmations
  has_many :clients, through: :confirmations
  belongs_to :event, inverse_of: :trips

  validates_presence_of :title, :date, :price

  has_paper_trail

  after_save :set_summary_url

  def set_summary_url
    if self.summary.nil?
      self.summary = "http://pourandpedal.com/trips/#{self.id}"
      self.save
    else
    end
  end

end
