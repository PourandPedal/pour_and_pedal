class AddGalleryToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :in_gallery, :boolean
  end
end
