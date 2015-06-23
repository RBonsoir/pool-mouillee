class PoolsController < ApplicationController
  def index
    @pools = Pool.all

    # Gmaps markers
    @markers = Gmaps4rails.build_markers(@pools) do |pool, marker|
      marker.lat 43.5528470
      marker.lng 7.0173690
    end
  end
end
