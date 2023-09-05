class UserTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :expenses

  validates :trip, uniqueness: { scope: :user }
end
