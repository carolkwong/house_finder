class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :apartment

  monetize :price_cents
end
