class RemoveApprovedFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :approved
  end

  def down
    add_column :reviews, :approved, :boolean
  end
end
