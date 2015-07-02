class Item < ActiveRecord::Base
  belongs_to :business
  validates_numericality_of :price, :greater_than => 0, :less_than => 100
end
