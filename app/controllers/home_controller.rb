class HomeController < ApplicationController
  def show
    @sessions = Session.includes(:person, :bookings).upcoming
  end
end
