class PagesController < ApplicationController
  
  def home
    @event = Event.new
    if current_user
      if params[:query].present?
        @events = current_user.events.search_by_name(params[:query]).order(updated_at: :desc)
        this_weeks_tasks = Task.where(due_date: (Date.today..Date.today + 7))
        @grouped_tasks = this_weeks_tasks.group_by { |task| task.due_date.strftime("%A") }

      else
        @events = current_user.events
        this_weeks_tasks = Task.where(due_date: (Date.today..Date.today + 7))
        @grouped_tasks = this_weeks_tasks.group_by { |task| task.due_date.strftime("%A") }
      end
    else
      render "pages/landing_page"
    end
  end
end
