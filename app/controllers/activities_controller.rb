class ActivitiesController < ApplicationController
  def delete
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new(activity_params)
    @activity.trip = @trip
    @activities = Activity.where(trip: @trip)
    authorize @activity
    if @activity.save
      redirect_to trip_path(@trip)
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:location, :category, :start_date, :price)
  end
end
