class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :book_date
      t.time :book_time
      t.text :location
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
