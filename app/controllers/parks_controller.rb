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
    Park.create(parks_params)
    redirect_to '/parks'
  end

  private
  def parks_params
    params.permit(:name, :location, :national_park_pass, :fee)
  end
end
