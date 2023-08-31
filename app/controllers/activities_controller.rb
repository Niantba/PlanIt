class ActivitiesController < ApplicationController
  def delete
  end

  def create
    @trip = Trip.find(params[:id])
    @activities = Activity.all
    @activity = Activity.new
  end
end
