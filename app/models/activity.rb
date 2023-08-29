class Activity < ApplicationRecord
  belongs_to :trip
  has_many :expenses
  has_many :comments

  validates :category, presence: true
end
