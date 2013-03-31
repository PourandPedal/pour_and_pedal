class RemoveEventIdFromClients < ActiveRecord::Migration
  def up
    remove_column :clients, :event_id
  end

  def down
    add_column :clients, :event_id, :integer
  end
end
