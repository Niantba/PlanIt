class ActivitiesController < ApplicationController
  def delete
  end

  def create
    raise
  end

  private

  def activity_params
    params.require(:activity).permit(:location, :category, :start_date, :price)
  end
end
