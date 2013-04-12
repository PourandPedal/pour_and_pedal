class GiftCertificate < ActiveRecord::Base
  attr_accessible :client_id, :confirmation_id, :client_attributes,
                  :date_purchased, :date_redeemed, :number_purchased,
                  :price_paid, :recipient_first_name, :recipient_email,
                  :recipient_last_name, :special_message

  has_one :client
  has_one :confirmation
  accepts_nested_attributes_for :client, allow_destroy: true

  def client_id
    self.client.try :id
  end

  def client_id=(id)
    self.client = Client.find(id)
  end

end
