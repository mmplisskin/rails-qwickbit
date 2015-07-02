class Item < ActiveRecord::Base
  belongs_to :business
  validates :name, :description, :price, presence: true
  validates_numericality_of :price, :greater_than => 0, :less_than => 100
  validates :description, length: { in: 30..175 }
end
