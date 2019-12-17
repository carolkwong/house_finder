class Photo < ApplicationRecord
  belongs_to :apartment

  mount_uploaders :photos, PhotoUploader
end
