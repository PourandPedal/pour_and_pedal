class RemoveStuffFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :price
    remove_column :events, :spots_available
    remove_column :events, :tickets_sold
  end

  def down
    add_column :events, :tickets_sold, :integer
    add_column :events, :spots_available, :integer
    add_column :events, :price, :decimal
  end
end
