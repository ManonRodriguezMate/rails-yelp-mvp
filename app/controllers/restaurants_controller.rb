class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :review]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # à modifier et rediriger vers restaurant
    redirect_to restaurant_path(@restaurant)
  end

  def show
    @review = Review.new
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address,:phone_number, :category)
  end

end
