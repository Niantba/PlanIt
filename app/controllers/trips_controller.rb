class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @trip.user_trips.build
    authorize @trip
  end

  def create
    raise
    @trip = Trip.new(trip_params)
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def index
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :destination, :user_trips[:user])
  end
end
