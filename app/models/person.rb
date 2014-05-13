class Person < ActiveRecord::Base
  has_many :sessions, dependent: :destroy

  def given_name
    name[/\w+/]
  end

  def screenhero_email
     if (value = read_attribute(:screenhero_email)).present?
       value
     else
       email
     end
  end
end
