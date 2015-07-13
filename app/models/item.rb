class Item < ActiveRecord::Base
  belongs_to :business
  validates :name, :description, :price, presence: true
  validates_numericality_of :price, :greater_than => 0, :less_than => 100
  validates :description, length: { in: 30..175 }
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

end
