class HomeController < ApplicationController
  def show
    @people = Person.includes(sessions: :bookings)
                    .where('sessions.starts_at > NOW()')
                    .order('sessions.starts_at ASC')

    @with = Person.all
  end
end
