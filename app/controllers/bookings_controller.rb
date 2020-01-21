class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_apartment, only: [:new]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new(apartment: @apartment)
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.state = "pending"
    @booking.user = current_user
    @booking.update(price:100)

    authorize @booking

    if @booking.save
      redirect_to new_booking_payment_path(@booking), notice: 'Redirecting to payment processing.'
    else
      render :new, alert: 'Error on creating booking.'
    end
    
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
      # send email if booking is updated
      send_amendment_email(@booking)
    else
      render :edit, alert: 'Error on updating booking.'
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'

    #TODO: send an email upon booking cancel
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_apartment
      @apartment = Apartment.find(params[:apartment_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:book_date, :state, :book_time, :content, :location, :user_id, :apartment_id)
    end

    # Group email groups into meaningful actions
    def send_amendment_email(booking)
      BookingMailer.with(booking_id: booking.id).amendment_host.deliver_later
      BookingMailer.with(booking_id: booking.id).amendment_user.deliver_later
    end
end
