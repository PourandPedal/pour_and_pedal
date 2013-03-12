class Event < ActiveRecord::Base
  attr_accessible :date, :description, :price, :title
end
