class ReviewsController < ApplicationController
    before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    # 1. get data from form
    @review = Review.new(review_params)
    # 2. Set the restaurant to the review
    @review.restaurant_id = @restaurant.id
    if @review.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
