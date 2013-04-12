class AddGiftToConfirmation < ActiveRecord::Migration
  def change
    add_column :confirmations, :gift_certificate_id, :integer
  end
end
