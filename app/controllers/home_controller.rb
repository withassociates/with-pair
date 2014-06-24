class HomeController < ApplicationController
  def show
    @people = Person.includes(:sessions, :bookings).available
    @sessions = Session.includes(:person, :bookings).upcoming
  end
end
