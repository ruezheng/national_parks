class ParkHikesController < ApplicationController

  def index
    @park = Park.find(params[:park_id])
    @hikes = @park.hikes
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
