class BookingMailer < ActionMailer::Base
  default from: "Pair With Associates <pair@withassociates.com>"

  def teacher_notification(booking)
    @booking = booking
    @session = @booking.session
    @person = @session.person

    mail to: @person.email,
         subject: "New booking on Pair"
  end

  def student_notification(booking)
    @booking = booking
    @session = @booking.session
    @person = @session.person

    mail to: @booking.email,
         subject: "Your booking on Pair"
  end
end
