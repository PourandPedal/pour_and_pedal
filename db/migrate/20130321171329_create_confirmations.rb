class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.string :confirmation
      t.integer :client_id
      t.boolean :is_used
      t.boolean :is_expired
      t.date :expiration_date
      t.string :source
      t.string :created_by
      t.decimal :value

      t.timestamps
    end
  end
end
