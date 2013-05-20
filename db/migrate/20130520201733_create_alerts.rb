class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :headline
      t.text :content
      t.boolean :show_alert

      t.timestamps
    end
  end
end
