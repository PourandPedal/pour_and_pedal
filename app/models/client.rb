class Client < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :zipcode,
  :event_id, :date_paid, :amount_paid

  has_one :event, through: :confirmation
  has_one :confirmation

end
