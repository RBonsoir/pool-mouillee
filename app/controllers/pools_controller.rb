class PoolsController < ApplicationController
  #before_action :find_user, only: [:create]


  def index
    # params
    @city = params[:city]
    @checkin_on = params[:checkin_on]
    @length = params[:length]
    p   @pools = Pool.near(@city, 10)
    # Gmaps markers
    @markers = Gmaps4rails.build_markers(@pools) do |pool, marker|
      p marker.lat pool.latitude
      p marker.lng pool.longitude
    end
  end

  def show
    # get params from search
    @checkin_on = params[:checkin_on] || " "
    @length = params[:length] || " "
    if @checkin_on
      @day = @checkin_on[8...10] || " "
      @month = @checkin_on[5...7] || " "
      @year = @checkin_on[0...4] || " "
    end

    # text display of length
    case @length
    when "Morning"
      @length_text = "for morning only"
    when "Afternoon"
      @length_text = "for afternoon only"
    when "All Day"
      @length_text = "for the whole day"
    when "All night long"
      @length_text = "for the whole night"
    end

    # get pool
    @pool = Pool.find(params[:id])
    @booking = Booking.new
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
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  private
    def find_user
      @user = current_user
    end

    def pool_params
      params.require(:pool).permit(:title, :address, :street_number, :route, :locality, :country, :price, :capacity, :availability, :content, :picture)
    end

end
