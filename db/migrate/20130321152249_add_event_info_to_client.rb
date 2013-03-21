class AddEventInfoToClient < ActiveRecord::Migration
  def change
    add_column :clients, :event_id, :integer
    add_column :clients, :amount_paid, :decimal
    add_column :clients, :date_paid, :datetime
  end
end
