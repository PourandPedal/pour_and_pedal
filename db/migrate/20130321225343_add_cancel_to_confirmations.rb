class AddCancelToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :is_cancelled, :boolean
  end
end
