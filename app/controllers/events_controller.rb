class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new] # update, destroy - later

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Successfully created the event"
    else
      flash.now[:alert] = "Something went wrong... Change the highlighted fields"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: "Successfully updated the event"
    else
      flash.now[:alert] = "Something went wrong... Change the highlighted fields"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to root_path, notice: "Successfully deleted the event"
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :description, :title)
  end
end
