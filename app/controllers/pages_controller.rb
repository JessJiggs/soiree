class PagesController < ApplicationController
  def home
    if current_user
      current_user.events ? @events = current_user.events : ""
    else
      redirect_to user_session_path
    end
  end

end
