class GuestsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests

    @guest = Guest.new
  end

  def create

  end

end
