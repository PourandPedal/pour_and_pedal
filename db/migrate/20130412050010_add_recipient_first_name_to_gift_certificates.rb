class AddRecipientFirstNameToGiftCertificates < ActiveRecord::Migration
  def change
    add_column :gift_certificates, :recipient_first_name, :string
  end
end
