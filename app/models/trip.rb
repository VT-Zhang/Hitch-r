class Trip < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :users, through: :passengers
  validates :dStreetNum, :dStreet, :dCity, :dState, :dZip, :aStreetNum, :aStreet, :aCity, :aState, :aZip, :dDate, :aDate, :price, presence: true

  validate :validDates
  def validDates
      if dDate < Date.today
          errors.add(:dDate, "must be in the future!")
      end
      if aDate < dDate
          errors.add(:aDate, "must be after your departure date!")
      end
  end
end
