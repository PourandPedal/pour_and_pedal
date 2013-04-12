class AddNumberOfTicketsToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :number_of_tickets, :integer
  end
end
