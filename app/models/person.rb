class Person < ActiveRecord::Base
  has_many :sessions, dependent: :destroy

  def given_name
    name[/\w+/]
  end
end
