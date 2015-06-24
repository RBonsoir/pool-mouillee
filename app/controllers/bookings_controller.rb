class BookingsController < ApplicationController

  def create
    params[:pool_id] = params[:pool_id].to_i
    params[:user_id] = params[:user_id].to_i
    @booking = Booking.new(booking_params)
    @booking.save

    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:pool_id, :user_id, :checkin_on, :length, :status)
  end
end
