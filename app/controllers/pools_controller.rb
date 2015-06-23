class PoolsController < ApplicationController
  #before_action :find_user, only: [:create]


  def index
    @pools = Pool.all

    # Gmaps markers
    @markers = Gmaps4rails.build_markers(@pools) do |pool, marker|
      marker.lat 43.5528470
      marker.lng 7.0173690
    end
  end

  def new
    @pool = Pool.new
  end

  def create
    p '===== debug pool ====='
    p params = pool_params
    p @pool = Pool.new(params)
    p '===== debug current user ====='
    p current_user
    p '===== debug assignement ====='
    p @pool.user = current_user
    p '===== debug assigned ====='
    if @pool.save
      p '===== save! ====='
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def find_user
      @user = current_user
    end

    def pool_params
      params.require(:pool).permit(:title, :address, :city, :price, :capacity, :availability, :content)
    end


end
