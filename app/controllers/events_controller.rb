class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "L'événement a été créé avec succès."
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])
    redirect_to events_path, alert: 'Événement introuvable.' unless @event
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price)
  end
end
