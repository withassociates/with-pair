class BookingsController < ApplicationController
  def new
    @session = Session.find(params[:session_id])
    @person = @session.person

    if @session.bookable?
      @booking = @session.bookings.new
    else
      redirect_to root_path
    end
  end

  def create
    if params[:booking][:winnie].present?
      head :unprocessable_entity and return
    end

    @session = Session.find(params[:session_id])
    @person = @session.person
    @booking = @session.bookings.new(booking_params)

    if @booking.save
      BookingMailer.teacher_notification(@booking).deliver
      BookingMailer.student_notification(@booking).deliver
      redirect_to [@session, @booking]
    else
      render :new
    end
  end

  def show
    @session = Session.find(params[:session_id])
    @person = @session.person
    @booking = @session.bookings.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :skype, :email, :project)
  end
end
