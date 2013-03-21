class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.string :zipcode

      t.timestamps
    end
  end
end
