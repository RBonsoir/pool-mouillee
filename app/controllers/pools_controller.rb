class PoolsController < ApplicationController
  def index
    # params
    @city = params[:city]
    @checkin_on = params[:checkin_on]
    @length = params[:length]

    # pool selection
    @pools = Pool.where(city: @city, availability: true)

    # Gmaps markers
    @markers = Gmaps4rails.build_markers(@pools) do |pool, marker|
      marker.lat 43.5528470
      marker.lng 7.0173690
    end

  def new

  end





  end

  def show
    @checkin_on = params[:checkin_on]
    @length = params[:length]
  end
end
