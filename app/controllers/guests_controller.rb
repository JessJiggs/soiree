class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests.order(updated_at: :desc)
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

  def update
    @event = Event.find(params[:event_id])
    guest = Guest.find(params[:id])
    guest.update!(guest_params)
    if guest.save
      redirect_to event_guests_path(@event)
    else
      redirect_to event_guests_path(@event), status: :unprocessable_entity, notice: "Guest was not successfully updated."
    end
  end

  private
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email_address, :phone_number)
  end
end
