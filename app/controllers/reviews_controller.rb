class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @tool = Tool.find(params[:tool_id])
    @review.tool = @tool
    @review.user_id = current_user.id
    @review.save
    redirect_to tool_path(@tool)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
