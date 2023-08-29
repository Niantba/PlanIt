class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :comments, presence: true
end
