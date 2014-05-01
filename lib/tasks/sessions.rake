require 'highline/import'

namespace :sessions do
  desc "Create sessions for all users"
  task :create => :environment do
    CreateSessions.perform(ENV['DAY']) do |session|
      say("<%= color 'Created session for #{session.person.name}', :green %>")
    end
  end

  desc "Remove all sessions"
  task :remove => :environment do
    say("<%= color 'Removing sessions', :red %>")
    RemoveSessions.perform
  end

  desc "Reset sessions"
  task :reset => [:remove, :create]
end
