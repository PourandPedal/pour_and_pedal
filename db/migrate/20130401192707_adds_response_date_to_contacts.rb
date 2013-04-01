class AddsResponseDateToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :response_date, :date
    add_column :contacts, :responded_by, :string
    add_column :contacts, :notes, :text
  end
end