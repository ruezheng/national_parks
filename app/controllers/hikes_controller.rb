class HikesController < ApplicationController
  def index
    @hikes = Hike.all
  end

  def show
    @hike = Hike.find(params[:id])
  end

  def edit
    @hike = Hike.find(params[:id])
  end

  def new

  end

  def create

  end

  def update
    hike = Park.find(params[:id])
    hike.update(park_params)
    redirect_to "/hikes/#{hike.id}"
  end

  private
  def hike_params
    params.permit(:name, :length_miles, :park_id, :open)
  end
end
