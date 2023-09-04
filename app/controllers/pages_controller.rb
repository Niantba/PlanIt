class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trips = Trip.all
  end

  def profile
    # Users
    @user = current_user
    @users = User.all
    # Documents
    @document = Document.new
    redirect_to profile_path if @document.save
    @documents = Document.all
    # Trips
    @trips = Trip.all
  end

  def add_documents
    current_user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(documents: [])
  end
end
