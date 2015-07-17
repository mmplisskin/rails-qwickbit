class Business < ActiveRecord::Base
  has_secure_password
  after_validation :geocode
  geocoded_by :full_address

  belongs_to :category
  has_many :items
  has_many :wallets

  validates :name, :description, :address, :city, :state, :zipcode, :phone_number, presence: true
  validates :name, length: { in: 5..25 }
  validates :description, length: { in: 30..1000 }
  validates_format_of :zipcode,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "please enter a valid zip"
  validates(:phone_number, :numericality => true, length: { minimum: 10, maximum: 10 })


  def full_address
    [address, city, state, zipcode].join(', ')
  end

  def self.search(params)
  # businesses = Business.all
    businesses = Business.where("name ILIKE ? OR description ILIKE ?", "%" + params[:search] + "%", "%" + params[:search] + "%") if params[:search].present?
    # items = items.near(params[:location], 20) if params[:location].present? && params[:search].present?
    businesses

  end



end
