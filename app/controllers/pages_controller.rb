class PagesController < ApplicationController
  def home
    if current_user
      @events = current_user.events
      @notes = current_user.notes.reverse
      @note = Note.new
      collaborations = current_user.collaborations
      tasks = collaborations.map do | collaboration |
        collaboration.tasks
      end
      this_weeks_tasks = tasks.flatten.select { |task| task.due_date >= Date.today && task.due_date <= Date.today + 14 }
      this_weeks_tasks = this_weeks_tasks.sort_by { |task| task.due_date }

    @grouped_tasks = this_weeks_tasks.group_by { |task| task.due_date.strftime("%A - %e/%m") }
    @grouped_tasks.sort_by

    if params[:query].present?
      @events = current_user.events.search_by_name(params[:query]).order(updated_at: :desc)
    else
      @events = current_user.events
    end
    # else
    #   render "pages/landing_page"
    # end
  end
end
