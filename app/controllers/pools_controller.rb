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
    @checkin_on = params[:checkin_on] || ""
    @length = params[:length] || " "

     # message to user
    if @checkin_on == ""
      @message_to_user = "Please choose a date"
    else
      @message_to_user = " "
    end

    if params[:length]
      @length_selection = [@length, "Morning", "Afternoon", "All Day", "All Night Long"].uniq
    else
      @length_selection = ["Morning", "Afternoon", "All Day", "All Night Long"]
    end

    # get pool
    @pool = Pool.find(params[:id])
    @booking = Booking.new

    # Gmaps marker
    @markers = Gmaps4rails.build_markers(@pool) do |pool, marker|
      p marker.lat pool.latitude
      p marker.lng pool.longitude
    end

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
