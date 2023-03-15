class EventsController < ApplicationController
  before_action :event_params, only: [ :create ]
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: "Event was successfully created." # please could we redicrect to @event page if an event is successfully created?
    else
      render :new, status: :unprocessable_entity, notice: "Event was not successfully created."
    end
  end

  def show
    @event = Event.find(params[:id])
    "This is the event bro!! #{@event}"
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :venue_name, :venue_address, :est_guests, :total_budget, :photo)
  end
end
