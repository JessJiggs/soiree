class TasksController < ApplicationController
  before_action :set_task, only: [ :update, :destroy ]
  before_action :set_event, only: [ :create, :index, :update, :destroy ]
  def create
    @task = Task.new(task_params)
    @task.event = @event
    if @task.save
      redirect_to event_tasks_path(@event), notice: "Task was successfully created."
    else
      redirect_to event_tasks_path(@event), status: :unprocessable_entity, notice: "Task was not successfully created."
    end
  end

  def index
    @task = Task.new
    @task.event = @event
    @tasks = @event.tasks

    @todo_tasks = @tasks.where(status: :to_do)
    @doing_tasks = @tasks.where(status: :doing)
    @done_tasks = @tasks.where(status: :done)

    @overdue_tasks = @tasks.where(status: [:to_do, :doing]).where("due_date < ?", Date.today)
    @incomplete_tasks = @tasks.where(status: [:to_do, :doing])
  end

  def update
    @task.event = @event
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to event_tasks_path(@event) }
      format.text { render partial: 'tasks/task_infos', locals: { task: @task }, formats: [:html] }
    end
  end

  def destroy
    @task.destroy
    redirect_to event_tasks_path(@event), notice: "Task was successfully deleted"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status, :category_list)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
