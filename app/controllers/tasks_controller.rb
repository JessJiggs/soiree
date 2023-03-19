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
    @task = Task.new
    @event = Event.find(params[:event_id])
    @task.event = @event
    @tasks = @event.tasks

    @todo_tasks = @tasks.where(status: :to_do)
    @doing_tasks = @tasks.where(status: :doing)
    @done_tasks = @tasks.where(status: :done)

    @overdue_tasks = @tasks.where(status: [:to_do, :doing]).where("due_date < ?", Date.today)
    @incomplete_tasks = @tasks.where(status: [:to_do, :doing])
  end

  def update
    @task = Task.find(params[:id])
    @event = Event.find(params[:event_id])
    @task.event = @event
    @task.update(task_params)

    respond_to do |format|
      format.html { redirect_to event_tasks_path(@event) }
      format.text { render partial: 'tasks/task_infos', locals: { task: @task }, formats: [:html] }
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status)
  end
end
