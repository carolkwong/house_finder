class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_apartment, only: [:new]

  # GET /bookings
  # GET /bookings.json
  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    authorize @booking
  end

  # GET /bookings/new
  def new
    @apartment = Apartment.find(params[:id])

    @booking = Booking.new

    @booking.apartment = @apartment
    authorize @booking
  end

  # GET /bookings/1/edit
  def edit
    authorize @booking
  end

  # POST /bookings
  # POST /bookings.json
  def create

    @booking = Booking.new(booking_params)
    @booking.state = "pending"
    @booking.user = current_user
    @booking.update(price:100)

    authorize @booking

    respond_to do |format|
      if @booking.save
        # format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.html { redirect_to new_booking_payment_path(@booking), notice: 'Redirecting to payment processing.' }
        # format.json { render :show, status: :created, location: @booking }
        format.json { render :show, status: :pending, location: new_booking_payment_path(@booking) }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    authorize @booking
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    authorize @booking
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:book_date, :state, :book_time, :content, :location, :user_id, :apartment_id)
    end
end
