class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user


    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'products/buy'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:buy_quantity, :billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
