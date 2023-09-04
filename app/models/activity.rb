class Activity < ApplicationRecord
  belongs_to :trip
  has_many :expenses
  has_many :comments

  attr_accessor :start_time
end
