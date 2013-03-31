class Confirmation < ActiveRecord::Base
  attr_accessible :client_id, :confirmation_number, :created_by,
  :expiration_date, :is_expired, :is_used, :source, :value, :trip_id,
  :is_cancelled

  belongs_to :trip
  belongs_to :client

end
