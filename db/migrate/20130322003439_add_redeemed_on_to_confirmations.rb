class AddRedeemedOnToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :redeemed_on, :date
  end
end
