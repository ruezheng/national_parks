class ParkHikesController < ApplicationController

  def index
    @park = Park.find(params[:park_id])
    @hikes = @park.hikes
    if params[:sort]
      @hikes = @park.hikes.sort
    end
  end

  def sort
    redirect_to action: "index", sort: true
  end

  def new
    @park = Park.find(params[:park_id])
  end

  def create
    park = Park.find(params[:park_id])
    park.hikes.create(hike_params)

    redirect_to "/parks/#{park.id}/hikes"
  end

  private
  def hike_params
    params.permit(:name, :length_miles, :open)
  end

end
