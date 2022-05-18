class ParksController < ApplicationController

  def index
		@parks = Park.order_by_time_created
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
  end

  def create
    Park.create(park_params)
    redirect_to '/parks'
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(park_params)
    redirect_to "/parks/#{park.id}"
  end

  def destroy
    park = Park.find(params[:id])
    park.destroy
    redirect_to '/parks'
  end

  private
  def park_params
    params.permit(:name, :location, :national_park_pass, :fee)
  end
end
