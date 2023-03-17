class PagesController < ApplicationController
  def home
    if current_user
      @events = current_user.events
    else
      render "pages/landing_page"
    end
  end
end
