class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_authentication
    if current_person.nil?
      session[:return_to] = request.path
      redirect_to '/auth/google_apps'
    end
  end

  def current_person
    @current_person ||= fetch_current_person
  end

  helper_method :current_person

  def fetch_current_person
    person_id = session[:person_id]
    Person.find(person_id) if person_id.present?
  end

  def redirect_back_or_default(default = root_path)
    return_to = session.delete(:return_to)
    redirect_to return_to || default
  end
end
