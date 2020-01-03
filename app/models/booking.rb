class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :apartment

  after_create :send_confirm_email



  private
  def send_confirm_email
  BookingMailer.with(booking: self).confirm.deliver_now
  end
end
