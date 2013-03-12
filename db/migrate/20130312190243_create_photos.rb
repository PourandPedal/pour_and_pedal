class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :location_id
      t.boolean :is_primary

      t.timestamps
    end
  end
end
