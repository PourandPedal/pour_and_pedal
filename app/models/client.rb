class Client < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :zipcode,
  :trip_id, :date_paid, :amount_paid

  has_one :trip, through: :confirmation
  has_one :confirmation

end
