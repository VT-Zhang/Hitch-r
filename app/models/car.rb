class Car < ApplicationRecord
  belongs_to :user
  validates :make, :model, :year, :trim, :style, :seats, :color, presence: true
end
