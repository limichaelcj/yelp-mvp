class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show update edit]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    save_checkpoint(@restaurant, :new)
  end

  def edit
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    update_checkpoint(@restaurant, restaurant_params, :edit)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def save_checkpoint(instance, path)
    if instance.save
      redirect_to restaurant_path(instance)
    else
      render path
    end
  end

  def update_checkpoint(instance, params, path)
    if instance.update(params)
      redirect_to restaurant_path(instance)
    else
      render path
    end
  end
end
