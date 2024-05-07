class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :registrations
  has_many :events, through: :registrations

  after_create :send_welcome_email

  def registered_for?(event)
    registrations.exists?(event_id: event.id)
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
