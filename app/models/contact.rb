class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :message, :phone
  has_paper_trail
end
