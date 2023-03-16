class PagesController < ApplicationController
  def home
    @events = current_user.events
  end
end
