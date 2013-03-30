class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.string :hometown
      t.text :content

      t.timestamps
    end
  end
end
