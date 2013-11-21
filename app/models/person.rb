class Person < ActiveRecord::Base
  has_many :sessions

  def given_name
    name[/\w+/]
  end
end
