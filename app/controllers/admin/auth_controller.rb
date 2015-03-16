class Admin::AuthController < ApplicationController
  def new
    redirect_to '/auth/google_oauth2'
  end

  def destroy
    session.delete(:person_id)
    redirect_to root_path
  end
end
