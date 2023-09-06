class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :activity, optional: true
  belongs_to :user
  has_many :user_expenses, dependent: :destroy
  has_many :users, through: :user_expenses
end
