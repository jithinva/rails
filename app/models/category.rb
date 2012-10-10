class Category < ActiveRecord::Base
  has_many:commodities,:dependent=>:destroy
  has_many:intakes,:through=>:commodities
  validates_presence_of:categories,:description
  validates_uniqueness_of :categories
end
