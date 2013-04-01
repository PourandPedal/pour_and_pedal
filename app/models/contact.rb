class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :message, :phone, :responded,
  :response_date, :responded_by, :notes

  has_paper_trail
end
