class CreateGiftCertificates < ActiveRecord::Migration
  def change
    create_table :gift_certificates do |t|
      t.string :recipent_first_name
      t.string :recipient_last_name
      t.string :recipient_email
      t.integer :client_id
      t.integer :confirmation_id
      t.date :date_purchased
      t.date :date_redeemed
      t.integer :number_purchased
      t.decimal :price_paid
      t.text :special_message

      t.timestamps
    end
  end
end
