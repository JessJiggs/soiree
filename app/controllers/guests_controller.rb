class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @event = Event.find(params[:event_id])
    @guest.event = @event
    if @guest.save
      redirect_to event_guests_path(@event), notice: "Guest was successfully added to the list."
    else
      redirect_to event_guests_path(@event), status: :unprocessable_entity, notice: "Guest was not successfully added."
    end
  end

  private
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email_address, :phone_number)
  end
end
