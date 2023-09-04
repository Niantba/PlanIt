class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_trips, dependent: :destroy
  has_many :trips, through: :user_trips
  # has_many :documents
  has_many :comments
  has_many :expenses
  has_many :user_expenses
  has_one_attached :image
  has_many_attached :documents

  validates :first_name, :last_name, :email, presence: true
end
