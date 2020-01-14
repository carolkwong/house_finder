class AddStatePaymentToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :state, :string
    add_column :bookings, :payment, :jsonb
  end
end
