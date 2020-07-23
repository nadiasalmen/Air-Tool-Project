class ReviewsController < ApplicationController

  def new
    @review = policy_scope(Review).new
    authorize @review
  end

  def create
    @review = policy_scope(Review).new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @tool = policy_scope(Tool).find(params[:tool_id])
    @review.tool = @tool
    @review.user_id = current_user.id
    authorize @review
    @review.save
    redirect_to tool_path(@tool)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
