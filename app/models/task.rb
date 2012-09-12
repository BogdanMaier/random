class Task < ActiveRecord::Base
  attr_accessible :category, :name, :points

  validates :name, :presence => true
  validates :category, :presence => true
end
