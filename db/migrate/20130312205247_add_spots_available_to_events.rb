class AddSpotsAvailableToEvents < ActiveRecord::Migration
  def change
    add_column :events, :spots_available, :integer
  end
end
