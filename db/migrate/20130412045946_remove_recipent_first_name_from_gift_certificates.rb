class RemoveRecipentFirstNameFromGiftCertificates < ActiveRecord::Migration
  def up
    remove_column :gift_certificates, :recipent_first_name
  end

  def down
    add_column :gift_certificates, :recipent_first_name, :string
  end
end
