class AddTripIdToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :trip_id, :integer
  end
end
