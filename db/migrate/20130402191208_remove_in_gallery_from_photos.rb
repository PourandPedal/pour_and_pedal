class RemoveInGalleryFromPhotos < ActiveRecord::Migration
  def up
    remove_column :photos, :in_gallery
  end

  def down
    add_column :photos, :in_gallery, :boolean
  end
end
