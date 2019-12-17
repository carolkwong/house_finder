class Photo < ApplicationRecord
  belongs_to :apartment
  mount_uploader :img, PhotoUploader
end