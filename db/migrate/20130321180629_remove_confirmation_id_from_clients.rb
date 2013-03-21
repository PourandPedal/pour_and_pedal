class RemoveConfirmationIdFromClients < ActiveRecord::Migration
  def up
    remove_column :clients, :confirmation_id
  end

  def down
    add_column :clients, :confirmation_id, :integer
  end
end
