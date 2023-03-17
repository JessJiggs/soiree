class EventsController < ApplicationController
  before_action :event_params, only: [:create]
  def index
    @events = current_user.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @collaboration = Collaboration.new(event: @event, user: current_user)

    if @event.save && @collaboration.save
      redirect_to event_path @event, notice: "Event was successfully created." # please could we redicrect to @event page if an event is successfully created?
    else
      render :new, status: :unprocessable_entity, notice: "Event was not successfully created."
    end
  end

  def show
    @event = Event.find(params[:id])
    @tasks = @event.tasks
  end

  def update

  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :venue_name, :venue_address,
                                  :est_guests, :total_budget, :photo)
  end
end
