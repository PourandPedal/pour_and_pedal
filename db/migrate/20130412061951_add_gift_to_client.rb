class AddGiftToClient < ActiveRecord::Migration
  def change
    add_column :clients, :gift_certificate_id, :integer
  end
end
