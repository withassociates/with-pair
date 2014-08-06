class Admin::HistoryController < ApplicationController
  before_filter :require_authentication

  def show
    @bookings = Booking
                .past
                .active
                .joins(session: :person)
                .includes(session: :person)
  end
end
