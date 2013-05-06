class CreateHomeTexts < ActiveRecord::Migration
  def change
    create_table :home_texts do |t|
      t.text :content

      t.timestamps
    end
  end
end
