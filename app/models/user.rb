class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :booking
  has_many :apartment

  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :date_of_birth, :presence => true
  validates :gender, :presence => true

  mount_uploader :avatar, AvatarUploader


end
