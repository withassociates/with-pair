# -*- coding: utf-8 -*-
require 'highline/import'

namespace :people do
  desc "Create all people"
  task :create => :environment do
    CreatePeople.perform do |person|
      say("<%= color 'Created #{person.name}', :green %>")
    end
  end

  desc "Remove all people"
  task :remove => :environment do
    say("<%= color 'Removing people', :red %>")
    RemovePeople.perform
  end

  desc "Reset people"
  task :reset => [:remove, :create]
end
