class HomeController < ApplicationController
  def show
    @sessions = Session.today
  end
end
