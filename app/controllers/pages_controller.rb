class PagesController < ApplicationController
  def home
    if current_user
      current_user.events ? @events = current_user.events : ""
    else
      render "pages/landing_page"
    end
  end

end
