class CreateHomeImages < ActiveRecord::Migration
  def change
    create_table :home_images do |t|
      t.string :photo
      t.integer :position
      t.string :title

      t.timestamps
    end
  end
end
