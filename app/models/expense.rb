class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :activity, optional: true
  belongs_to :user
end
