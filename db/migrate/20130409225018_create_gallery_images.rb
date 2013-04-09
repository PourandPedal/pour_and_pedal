class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :title
      t.string :photo
      t.string :caption

      t.timestamps
    end
  end
end
