class BookingsController < ApplicationController
  def new
    @session = Session.find(params[:session_id])
    @booking = @session.bookings.new
  end

  def create
    @session = Session.find(params[:session_id])
    @booking = @session.bookings.new(booking_params)

    if @booking.save
      PersonMailer.booking_notification(@booking).deliver
      redirect_to [@session, @booking]
    else
      render :new
    end
  end

  def show
    @session = Session.find(params[:session_id])
    @booking = @session.bookings.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :skype, :email, :project)
  end
end
