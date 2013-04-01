class AddRespondedToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :responded, :boolean, default: false
  end
end
