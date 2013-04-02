class AddIsPrimaryForLocationToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :primary_for_location, :boolean
    add_column :photos, :primary_for_event, :boolean
  end
end
