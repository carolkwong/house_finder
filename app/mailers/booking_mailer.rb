class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirm.subject
  #
  def confirm
    @booking = params[:booking]
    @greeting = "Hi"

    mail (to: @booking.user.email, subject: 'Your booking is confirmed')
  end
end
