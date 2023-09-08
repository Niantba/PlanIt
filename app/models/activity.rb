class Activity < ApplicationRecord
  belongs_to :trip
  has_many :expenses
  has_many :comments, dependent: :destroy
  has_many_attached :files

  validates :name, :location, presence: true

  attr_accessor :start_time

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
