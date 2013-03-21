class Confirmation < ActiveRecord::Base
  attr_accessible :client_id, :confirmation_number, :created_by,
  :expiration_date, :is_expired, :is_used, :source, :value, :event_id

  belongs_to :event
  belongs_to :client

end
