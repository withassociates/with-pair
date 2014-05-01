class Admin::DashboardController < ApplicationController
  before_filter :require_authentication

  def show
    @sessions = current_person.sessions
    @new_session = @sessions.new
  end
end
