class AddSummaryToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :summary, :string
  end
end
