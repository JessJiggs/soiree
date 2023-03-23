class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @guest = Guest.new

    if params[:query].present?
      @guests = @event.guests.search_by_first_name_and_last_name_and_email_address_and_phone_number_and_invitation_status(params[:query]).order(updated_at: :desc)
    else
      @guests = @event.guests.order(updated_at: :desc)
    end

    @guests_not_sent = @event.guests.invite_not_sent.count
    @guests_invited = @event.guests.invited.count
    @guests_accepted = @event.guests.accepted.count
    @guests_declined =  @event.guests.declined.count

  end

  def create
    @event = Event.find(params[:event_id])
    @guest = Guest.new(guest_params)
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
      redirect_to event_guests_path(@event), notice: "Guest was successfully updated."
    else
      redirect_to event_guests_path(@event), status: :unprocessable_entity, notice: "Guest was not successfully updated."
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    guest = Guest.find(params[:id])
    guest.destroy
    redirect_to event_guests_path(@event), notice: "Guest was successfully removed"
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email_address, :phone_number, :invitation_status)
  end
end
