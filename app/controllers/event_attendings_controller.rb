class EventAttendingsController < ApplicationController
  # we know current user
  # in params should be id of the event
  # i bajlando aha no i czek czy jest logged in before fucking doing stuff
  before_action :authenticate_user!

  def create
    current_user.attended_events << Event.find(params[:event_id])

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @attendance = EventAttending.find(params[:id])
    @attendance.destroy

    redirect_back(fallback_location: root_path)
  end
end
