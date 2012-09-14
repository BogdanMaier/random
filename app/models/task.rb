class Task < ActiveRecord::Base
  attr_accessible :category, :name, :points

  validates :name, :presence => true
  validates :category, :presence => true
  CATEGORY = ["indoor","outdoor","entertaining","group","cognitive","long period","big area","sexy time"]
end
