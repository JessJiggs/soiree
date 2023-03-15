class GuestsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests
    @guest = Guest.new
  end

  def create
    # if @guest.save
    #   redirect_to event_guests_path(@event), notice: "Guest was successfully added to the list."
    # else
    #   redirect_to event_guests_path(@event), status: :unprocessable_entity, notice: "Guest was not successfully added."
    # end
  end

end
