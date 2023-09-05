class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @trip.user_trips.build
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    if @trip.save
      UserTrip.create(user: current_user, trip: @trip, owner: true)
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def show
    @trip = Trip.find(params[:id])
    @user_trip = UserTrip.new
    @users = @trip.users
    authorize @trip
    @activities = Activity.where(trip: @trip)
    @activity = Activity.new
    @comment = Comment.new
  end

  def index
    @trips = Trip.all
    @trips = policy_scope(Trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :destination, user_ids: [])
    # params.require(:trip).permit(:start_date, :end_date, :destination, user_trips_attributes: [:user_id])
  end
end
