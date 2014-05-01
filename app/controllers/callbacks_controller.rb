class CallbacksController < ApplicationController
  protect_from_forgery except: :handle

  def handle
    auth = request.env['omniauth.auth']
    email = auth['info']['email']
    person = Person.find_by_email(email)

    if person
      session[:person_id] = person.id
      redirect_back_or_default
    else
      head :unauthorized
    end
  end
end
