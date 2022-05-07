class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new] # update, destroy - later

  def index
    # Add all events instance variable and attended events
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_url # temporary
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :description)
  end
end
