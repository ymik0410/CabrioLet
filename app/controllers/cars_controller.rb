class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      raise
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:title, :model, :year, :city, :description, :price, :photo)
  end
end
