class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:chef, :show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end


  def top
    @restaurants = Restaurant.where(stars: 5)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

    def chef
    @chef_name = @restaurant.chef_name
  end

    def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
    redirect_to restaurant_path(@restaurant)
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
