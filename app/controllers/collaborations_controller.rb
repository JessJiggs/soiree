class CollaborationsController < ApplicationController
  def create
    # find event instance
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    # find the searched user
    # create a new collaboration instance and save
    @collaboration = Collaboration.new(event: @event, user: @user)
    if @collaboration.save
      redirect_to event_path @event, notice: "Collaborator was successfully Added."
    else
      render :new, status: :unprocessable_entity, notice: "Event was not successfully created."
    end
  end
end
