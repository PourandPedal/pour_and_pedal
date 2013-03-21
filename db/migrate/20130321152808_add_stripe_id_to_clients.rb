class AddStripeIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :stripe_id, :string
  end
end
