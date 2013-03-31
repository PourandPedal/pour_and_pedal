class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.datetime :date
      t.decimal :price
      t.integer :spots_available
      t.integer :tickets_sold
      t.integer :event_id

      t.timestamps
    end
  end
end
