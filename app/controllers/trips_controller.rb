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
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity})
      }
    end
  end

  def index
    @trips = Trip.all
    @trips = policy_scope(Trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    authorize @trip
    @trip.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :destination, user_ids: [])
    # params.require(:trip).permit(:start_date, :end_date, :destination, user_trips_attributes: [:user_id])
  end
end
