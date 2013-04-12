class Confirmation < ActiveRecord::Base
  attr_accessible :client_id, :confirmation_number, :created_by,
  :expiration_date, :is_expired, :is_used, :source, :value, :trip_id,
  :is_cancelled, :gift_certificate_id

  belongs_to :trip
  belongs_to :client
  belongs_to :gift_certificate

  validates_presence_of :confirmation_number

  has_paper_trail

end
