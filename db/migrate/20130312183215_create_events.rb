class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
