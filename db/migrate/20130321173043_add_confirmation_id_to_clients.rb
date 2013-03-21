class AddConfirmationIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :confirmation_id, :integer
  end
end
