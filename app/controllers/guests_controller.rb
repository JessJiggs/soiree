class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @guest = Guest.new

    @invitation_status = [invite_not_sent: "Invite not sent", invited: "Invite sent", accepted: "Accepted", declined: "Declined"]

    if params[:query].present?
      @guests = @event.guests.search_by_first_name_and_last_name_and_email_address_and_phone_number_and_invitation_status(params[:query]).order(updated_at: :desc)
    else
      @guests = @event.guests.order(updated_at: :desc)
    end

    @invite_not_sent_guests = @event.guests.invite_not_sent.count
    @invited_guests = @event.guests.invited.count
    @accepted_guests = @event.guests.accepted.count
    @declined_guests = @event.guests.declined.count

    @guests_not_sent = @event.est_guests - @invite_not_sent_guests
    @guests_invited = @event.est_guests - @invited_guests - @accepted_guests - @declined_guests
    @guests_accepted = @event.est_guests - @invited_guests - @declined_guests
    @guests_declined = @event.est_guests - @invited_guests - @accepted_guests

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
