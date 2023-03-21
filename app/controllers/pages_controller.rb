class PagesController < ApplicationController
  def home
    if current_user
      if params[:query].present?
        @events = current_user.events.search_by_name(params[:query]).order(updated_at: :desc)
      else
        @events = current_user.events
      end
    else
      render "pages/landing_page"
    end
  end
end
