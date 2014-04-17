require 'highline/import'
require 'chronic'

namespace :sessions do
  desc "Create sessions for all users"
  task :create => :environment do
    epoch = if day = ENV['DAY']
              Chronic.parse(day).beginning_of_day
            elsif Time.now.hour <= 9
              Date.today
            else
              Date.tomorrow
            end + 10.hours

    Person.all.each_with_index do |person, index|
      starts_at = epoch + index.hours

      say("<%= color 'Creating session for #{person.name} #{starts_at.strftime('on %d/%m/%Y at %H:%M')}', :green %>")

      person.sessions.create(
        starts_at: starts_at,
        ends_at: starts_at + 30.minutes
      )
    end
  end

  desc "Clear all sessions"
  task :clear => :environment do
    say("<%= color 'Removing sessions', :red %>")
    Booking.destroy_all
    Session.destroy_all
  end

  desc "Reset sessions"
  task :reset => [:clear, :create]
end
