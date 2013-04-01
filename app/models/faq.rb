class Faq < ActiveRecord::Base
  attr_accessible :answer, :question

  has_paper_trail
end
