class AddAnswerToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :answer, :text
  end
end
