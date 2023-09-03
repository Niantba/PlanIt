class CommentsController < ApplicationController
  def create
    # add instance of activities
    @activity = Activity.find(params[:activity_id])
    @comment = Comment.new(comment_params)
    @comment.activity = @activity
    @comments = Comment.where(activity: @activity)
    authorize @comment
    @comment.user = current_user
    if @comment.save
      redirect_to trip_path(@trip)
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
