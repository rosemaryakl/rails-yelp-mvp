class ReviewsController < ApplicationController
    before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    # 1. get data from form
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 2. Set the restaurant to the review
    @review.restaurant_id = @restaurant.id
    if @review.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
    id = @review.restaurant_id
    if @review.save
      redirect_to restaurant_path(id)
    else
      render :edit
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

end
