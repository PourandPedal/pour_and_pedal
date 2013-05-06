class AddVisibleToHomeTexts < ActiveRecord::Migration
  def change
    add_column :home_texts, :visible, :boolean
  end
end
