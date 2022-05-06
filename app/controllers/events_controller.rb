class EventsController < ApplicationController
  def index
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

  private

  def event_params
    params.require(:event).permit(:location, :date, :description)
  end
end
