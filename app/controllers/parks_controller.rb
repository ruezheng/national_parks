class ParksController < ApplicationController

  def index
		@parks = Park.order_by_time_created
  end

  def show
    @park = Park.find(params[:id])
  end
end
