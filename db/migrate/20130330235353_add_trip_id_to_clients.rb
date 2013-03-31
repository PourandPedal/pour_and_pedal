class AddTripIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :trip_id, :integer
  end
end
