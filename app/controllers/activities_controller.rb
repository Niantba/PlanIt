class ActivitiesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new(activity_params)
    @activity.trip = @trip
    @activity.start_date = DateTime.parse([params[:activity][:start_date], params[:activity][:start_time]].join(' '))
    @activities = Activity.where(trip: @trip)
    authorize @activity
    if @activity.save
      redirect_to trip_path(@trip)
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  def update
    @activity = Activity.find(params[:id])
    @trip = @activity.trip
    params[:activity][:start_date] = DateTime.parse([params[:activity][:start_date], params[:activity][:start_time]].join(' '))
    params[:activity].delete(:start_time)
    authorize @trip
    if @activity.update(activity_params)
      redirect_to trip_path(@trip)
    else
      redirect_to activity_path(@activity)
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    trip = @activity.trip
    @activity.destroy
    authorize trip
    redirect_to trip_path(trip)
  end

  private

  def activity_params
    params.require(:activity).permit(:location, :category, :start_date, :price, :name, :start_time)
  end
end
