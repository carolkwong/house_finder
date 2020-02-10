class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :booking
  has_many :apartment

  mount_uploader :avatar, AvatarUploader

  #combine and capitalize first_name + last_name, to full_name
  def full_name
    if first_name? && last_name?
      name_words = first_name.split(" ") + last_name.split(" ")
      return name_words.map{ |w| w.capitalize }.join(" ")
    else
      return email
    end
  end

end
