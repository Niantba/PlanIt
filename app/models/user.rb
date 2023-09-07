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

  def avatar
    if image.attached?
      return "<img src='#{image.url}'> #{first_name}".html_safe
    else
      return "
        <div class='trip-banner-card-users-circle'>
          <span class='trip-banner-card-users-initials'>
            #{first_name.chars.first}
          </span>
        </div>
        #{first_name}
      ".html_safe
    end
  end
end
