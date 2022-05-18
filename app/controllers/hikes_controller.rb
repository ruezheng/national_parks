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
    Hike.create(hike_params)
    redirect_to '/hikes'
  end

  def update
    hike = Hike.find(params[:id])
    hike.update(hike_params)
    redirect_to "/hikes/#{hike.id}"
  end

  private
  def hike_params
    params.permit(:name, :length_miles, :open)
  end
end
