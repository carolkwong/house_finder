class Apartment < ApplicationRecord
  has_many :photo
  has_many :booking
  belongs_to :user
end
