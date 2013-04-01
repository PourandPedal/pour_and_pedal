class RemoveActivityFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :last_login_at
    remove_column :users, :last_logout_at
    remove_column :users, :last_activity_at
  end

  def down
    add_column :users, :last_activity_at, :datetime
    add_column :users, :last_logout_at, :datetime
    add_column :users, :last_login_at, :datetime
  end
end
