class HomeController < ApplicationController
  def show
    @sessions = Session.upcoming
  end
end
