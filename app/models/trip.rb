class Trip < ApplicationRecord
  has_many :user_trips
  has_many :activities

  validates :start_date, :end_date, :destination, presence: true
end
