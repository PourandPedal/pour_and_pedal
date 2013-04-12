class AddGiftsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :gifts_purchased, :integer
  end
end
