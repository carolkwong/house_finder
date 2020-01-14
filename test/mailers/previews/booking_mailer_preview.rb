# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/confirm
  def confirm

    booking = Booking.first
    BookingMailer.with(booking:booking).confirm.deliver_now

  end

end
