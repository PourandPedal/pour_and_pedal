class AddEventIdToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :event_id, :integer
  end
end
