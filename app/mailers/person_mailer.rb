class PersonMailer < ActionMailer::Base
  default from: "pair@withassociates.com"

  def booking_notification(booking)
    @booking = booking
    @session = @booking.session
    @person = @session.person

    mail to: @person.email,
         subject: "New booking"
  end
end
