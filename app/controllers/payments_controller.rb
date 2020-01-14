class PaymentsController < ApplicationController

def new

  @booking = current_user.booking.where(state:'pending').find(params[:booking_id])
  authorize @booking

end

def create

  @booking = current_user.booking.where(state:'pending').find(params[:booking_id])
  authorize @booking

  user = Stripe::Customer.create(
    source:params[:stripeToken],
    email: params[:stripeEmail]
    )


  charge = Stripe::Charge.create(
    customer: user.id,
    amount: @booking.price_cents,
    description: "Payment of Apartment viewing fee",
    currency: @booking.price.currency
    )


  @booking.update(payment:charge.to_json, state:'paid')

  redirect_to booking_path(@booking)

rescue Stripe::CardError => e
  flash[:alert]= e.message

  redirect_to new_booking_payment_path(@booking)
end

end
