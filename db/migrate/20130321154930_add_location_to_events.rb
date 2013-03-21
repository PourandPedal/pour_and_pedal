class AddLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :string
    add_column :events, :directions, :text
  end
end
