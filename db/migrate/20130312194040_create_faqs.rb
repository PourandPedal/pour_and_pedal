class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
