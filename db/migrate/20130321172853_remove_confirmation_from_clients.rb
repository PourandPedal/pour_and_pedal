class RemoveConfirmationFromClients < ActiveRecord::Migration
  def up
    remove_column :clients, :confirmation
  end

  def down
    add_column :clients, :confirmation, :string
  end
end
