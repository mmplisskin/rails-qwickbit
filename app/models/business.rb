class Business < ActiveRecord::Base
  has_secure_password
  after_validation :geocode
  geocoded_by :full_address

  belongs_to :category
  has_many :items
  has_many :wallets

  validates :name, :description, :address, :city, :state, :zipcode, :phone_number, presence: true
  validates :name, length: { in: 5..25 }
  validates :description, length: { in: 30..175 }
  validates_format_of :zipcode,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "please enter a valid zip"
  validates(:phone_number, :numericality => true, length: { minimum: 10, maximum: 10 })


  def full_address
    [address, city, state, zipcode].join(', ')
  end



end
