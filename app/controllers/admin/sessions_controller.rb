class Admin::SessionsController < ApplicationController
  before_filter :require_authentication

  def create
    Chronic.time_class = Time.zone

    attrs = params.require(:session).permit(:starts_at)
    starts_at = Chronic.parse(attrs[:starts_at])
    ends_at = starts_at + 30.minutes

    @new_session = current_person.sessions.new(
      starts_at: starts_at,
      ends_at: ends_at
    )

    if @new_session.save
      redirect_to admin_root_path
    else
      render 'admin/dashboard/show'
    end
  end

  def destroy
    @session = Session.find(params.require(:session_id))
    @session.destroy
    redirect_to admin_root_path
  end
end
