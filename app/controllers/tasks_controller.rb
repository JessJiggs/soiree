class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    @event = Event.find(params[:event_id])
    @task.event = @event
    if @task.save
      redirect_to event_tasks_path(@event), notice: "Task was successfully created."
    else
      redirect_to event_tasks_path(@event), status: :unprocessable_entity, notice: "Event was not successfully created."
    end
  end

  def index
    @tasks = Task.all
    @task = Task.new
    @event = Event.find(params[:event_id])
    @task.event = @event
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status)
  end
end
