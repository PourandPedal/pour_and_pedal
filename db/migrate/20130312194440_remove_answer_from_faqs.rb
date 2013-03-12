class RemoveAnswerFromFaqs < ActiveRecord::Migration
  def up
    remove_column :faqs, :answer
  end

  def down
    add_column :faqs, :answer, :string
  end
end
