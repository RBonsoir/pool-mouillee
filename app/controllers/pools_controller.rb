class PoolsController < ApplicationController
  #before_action :find_user, only: [:create]


  def index
    # params
    @city = params[:city]
    @checkin_on = params[:checkin_on]
    @length = params[:length]

    # pool selection
    @pools = Pool.where(city: @city)

    # Gmaps markers
    @markers = Gmaps4rails.build_markers(@pools) do |pool, marker|
      marker.lat 43.5528470
      marker.lng 7.0173690
    end
  end

  def show
    @checkin_on = params[:checkin_on]
    @length = params[:length]
  end

  def new
    @pool = Pool.new
  end

  def create
    params = pool_params
    @pool = Pool.new(params)
    current_user
    @pool.user = current_user
    @pool.availability = true
    if @pool.save
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
