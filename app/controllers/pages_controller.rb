class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      @upcoming_trips = current_user.trips
      upcoming_trips_ids = @upcoming_trips.map(&:id).uniq
      @featured_trips = Trip.where.not(id: upcoming_trips_ids)
    else
      @featured_trips = Trip.all
    end
  end

  def profile
    # Users
    @user = current_user
    @users = User.all
    # Documents
    @document = Document.new
    redirect_to profile_path if @document.save
    @documents = Document.all
    # Upcoming Trips
    @upcoming_trips = current_user.trips
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
