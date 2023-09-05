class UserTripsController < ApplicationController
  def new
    # add an instance of trip
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @user_trip = UserTrip.new
    @users = @trip.users
    @activities = Activity.where(trip: @trip)
    @activity = Activity.new
    authorize @trip
    params[:user_trip][:user_id].each do |user_id|
      UserTrip.create(trip: @trip, user: User.find(user_id.to_i))
    end
    redirect_to trip_path(@trip)
  end
end
