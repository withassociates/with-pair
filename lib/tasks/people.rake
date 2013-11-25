require 'highline/import'

namespace :people do
  desc "Create all people"
  task :create => :environment do
    PEOPLE.each do |attrs|
      say("<%= color 'Creating #{attrs[:name]}', :green %>")
      Person
      .find_or_create_by(attrs.slice(:email))
      .update_attributes(attrs)
    end
  end

  desc "Remove all people"
  task :clear => :environment do
    say("<%= color 'Removing people', :red %>")
    Person.destroy_all
  end

  desc "Reset people"
  task :reset => [:clear, :create]
end

PEOPLE = [{
  name: 'Mathew Wilson O’Day',
  email: 'mathew@withassociates.com',
  skills: 'Design, UX, Project Management, Running a Business'
}, {
  name: 'Erin Staniland',
  email: 'erin@withassociates.com',
  skills: 'Ruby, Systems Architecture, Running a Business'
}, {
  name: 'Jenifer Dunn',
  email: 'jenifer@withassociates.com',
  skills: 'Javascript, CSS, Running a Business'
}, {
  name: 'Anna Goss',
  email: 'anna@withassociates.com',
  skills: 'UX, Project Management'
}, {
  name: 'Jamie White',
  email: 'jamie@withassociates.com',
  skills: 'Ruby, Javascript, Ember.js, CSS'
}, {
  name: 'Thomas Marshall',
  email: 'thomas@withassociates.com',
  skills: 'Javascript, CSS, Ruby'
}, {
  name: 'Brendan Gatens',
  email: 'brendan@withassociates.com',
  skills: 'Design, UX, CSS'
}, {
  name: 'Joseph Morrow',
  email: 'joseph@withassociates.com',
  skills: 'Design, UX, CSS, Javascript'
}]
