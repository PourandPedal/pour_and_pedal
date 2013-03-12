class AddTicketsSoldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tickets_sold, :integer
  end
end
