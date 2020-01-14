class Apartment < ApplicationRecord
  has_many :photos
  has_many :bookings
  belongs_to :user

  def self.options_for_district
  	["Central and Western", "Eastern", "Southern", "Wan Chai", "Kowloon City", "Kwun Tong", "Sham Shui Po", "Wong Tai Sin", "Yau Tsim Mong", "Islands", "Kwai Tsing", "North", "Sai Kung", "Sha Tin", "Tai Po", "Tsuen Wan", "Tuen Mun", "Yeun Long"]
  end
end
