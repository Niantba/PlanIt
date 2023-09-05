class CommentsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:activity_id])
    @comment = Comment.new(comment_params)
    @comment.activity = @activity
    @comments = Comment.where(activity: @activity)
    @comment.user = current_user
    @users = User.all
    authorize @comment
    if @comment.save
      redirect_to trip_path(@trip)
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
