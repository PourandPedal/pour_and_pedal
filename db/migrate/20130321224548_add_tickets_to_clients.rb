class AddTicketsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :tickets_purchased, :integer
  end
end
