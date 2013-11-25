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
  skills: 'Ruby, Systems Architecture, Running a Business',
  screenhero_url: 'http://join.screenhero.com/24e98dcfb84e5e4f7b434df903a80e4e'
}, {
  name: 'Jenifer Dunn',
  email: 'jenifer@withassociates.com',
  skills: 'Javascript, CSS, Running a Business',
  screenhero_url: 'http://join.screenhero.com/3b94e3b9422e33de34e79165b5b30481'
}, {
  name: 'Anna Goss',
  email: 'anna@withassociates.com',
  skills: 'UX, Project Management',
  screenhero_url: 'http://join.screenhero.com/0cb6635c9ca6c50f8f776d9ec74c9195'
}, {
  name: 'Jamie White',
  email: 'jamie@withassociates.com',
  skills: 'Ruby, Javascript, Ember.js, CSS',
  screenhero_url: 'http://join.screenhero.com/b9576e9e121b98278f65290035174a55'
}, {
  name: 'Thomas Marshall',
  email: 'thomas@withassociates.com',
  skills: 'Javascript, CSS, Ruby',
  screenhero_url: 'http://join.screenhero.com/58540a454cade8d927c5fd77c35f589f'
}, {
  name: 'Brendan Gatens',
  email: 'brendan@withassociates.com',
  skills: 'Design, UX, CSS',
  screenhero_url: 'http://join.screenhero.com/e66ea2f91eafdc473837ad0e61cee272'
}, {
  name: 'Joseph Morrow',
  email: 'joseph@withassociates.com',
  skills: 'Design, UX, CSS, Javascript',
}]
