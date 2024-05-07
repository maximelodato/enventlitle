class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Bienvenue sur notre application')
    end

    def participation_email(event_creator, attendance)
        @event_creator = event_creator
        @attendance = attendance
        mail(to: @event_creator.email, subject: 'Nouvelle participation à votre événement')
      end
  end