class ChangeConfirmationforConfirmations < ActiveRecord::Migration
  def up
    rename_column :confirmations, :confirmation, :confirmation_number
  end

  def down
    rename_column :confirmations, :confirmation_number, :confirmations
  end
end
