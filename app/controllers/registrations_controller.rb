class RegistrationsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def new
    @registration = Registration.new
  end

  def create
    @event = Event.find(params[:event_id])
    @registration = current_user.registrations.build(event: @event)

    if @registration.save
      redirect_to @event, notice: 'Participation validée avec succès.'
    else
      render :new
    end
  end
end
