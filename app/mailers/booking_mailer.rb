class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirm.subject
  #
  def confirm_user
    @booking = Booking.find(params[:booking_id])
    @name = @booking.user.full_name

    @host = @booking.apartment.user

    mail(to: @booking.user.email, subject: 'Your booking is confirmed')
  end

  def confirm_host
    @booking = Booking.find(params[:booking_id])
    @name = @booking.apartment.user.full_name

    @user = @booking.user

    mail(to: @booking.apartment.user.email, subject: 'A booking is confirmed on your apartment')
  end

  def amendment_user
    @booking = Booking.find(params[:booking_id])
    @name = @booking.user.full_name

    @host = @booking.apartment.user

    mail(to: @booking.user.email, subject: 'Your booking has an amendment')
  end

  def amendment_host
    @booking = Booking.find(params[:booking_id])
    @name = @booking.apartment.user.full_name

    @user = @booking.user

    mail(to: @booking.apartment.user.email, subject: 'A booking on your apartment has an amendment')
  end
end
