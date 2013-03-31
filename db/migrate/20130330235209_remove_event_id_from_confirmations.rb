class RemoveEventIdFromConfirmations < ActiveRecord::Migration
  def up
    remove_column :confirmations, :event_id
  end

  def down
    add_column :confirmations, :event_id, :integer
  end
end
