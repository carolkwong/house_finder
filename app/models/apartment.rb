class Apartment < ApplicationRecord
  has_many :photos
  has_many :booking
  belongs_to :user


  mount_uploader :photo, PhotoUploader


end
