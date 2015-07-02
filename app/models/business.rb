class Business < ActiveRecord::Base
  belongs_to :category
  has_many :items

  validates :name, :description, :address, :city, :state, :zipcode, :phone_number, presence: true

  validates :name, length: { in: 5..25 }

  validates_format_of :zipcode,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "please enter a valid zip"

  validates(:phone_number, :numericality => true, length: { minimum: 10, maximum: 10 })
end
