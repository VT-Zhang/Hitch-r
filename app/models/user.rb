class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  PASSWORD_VALIDATOR = /(?=.*[A-Z])(?=.*\d)/
  has_many :cars
  has_many :trips, through: :passenger
  has_many :isPassengers, through: :trips, source: :passenger
  validates :f_name, :l_name, :email, :street_num, :street, :city, :state, :zipCode, :phone, :bday, presence: true
  before_create :password, :password_confirmation, length: {minimum: 8}, format: {with: PASSWORD_VALIDATOR}, presence: true
  validates :email, uniqueness: { case_sensitive:false }, format: { with: EMAIL_REGEX}
  validates :zipCode, length: {is: 5}, numericality: true
  validates :zipCode, numericality: {:greater_than => 0, message: "Zip Code must be a positive number"}
  validate :isOldEnough

  def isOldEnough
      validDate = Date.today - 18.years
      if bday.to_date + 18.years > Date.today
          errors.add(:bday, "must be before #{validDate} to join!!")
      end
  end
end
