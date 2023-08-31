class TripsController < ApplicationController
  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
  end

  def update
  end

  def show
  end

  def index
    @trips = Trip.all
  end
end
