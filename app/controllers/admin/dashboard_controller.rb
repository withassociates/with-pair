class Admin::DashboardController < ApplicationController
  before_filter :require_authentication

  def show
    @sessions = current_person.sessions.includes(:bookings)
    @new_session = @sessions.new
  end

  def update
    if current_person.update_attributes(person_params)
      flash[:admin] = 'Skills updated!'
      redirect_to admin_root_path
    else
      flash[:admin] = 'There was a problem updating your skills...'
      render 'show'
    end
  end

  private

  def person_params
    params.require(:person).permit(:skills, :screenhero_email)
  end
end
