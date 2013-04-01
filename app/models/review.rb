class Review < ActiveRecord::Base
  attr_accessible :content, :email, :hometown, :name, :featured

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :hometown, presence: true, length: { maximum: 50 }
  validates :content, presence: true

end
