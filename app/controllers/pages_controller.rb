class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @document = Document.new
  end

  # private

  # def user_params
  #   params.require(:user).permit(:image)
  # end
end
