class EventsPhotosTable < ActiveRecord::Migration
  def change
    create_table :events_photos, id: false do |t|
      t.integer :event_id
      t.integer :photo_id
    end
  end
end
