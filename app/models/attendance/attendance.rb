class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event
  
    after_create :send_participation_email_to_event_creator
  
    private
  
    def send_participation_email_to_event_creator
      UserMailer.participation_email(event.user, self).deliver_now
    end
  end