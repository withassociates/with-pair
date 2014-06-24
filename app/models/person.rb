class Person < ActiveRecord::Base
  has_many :sessions, dependent: :destroy
  has_many :bookings, through: :sessions

  def self.available
    joins(:sessions)
    .where('sessions.starts_at > NOW()')
    .order('sessions.starts_at ASC')
  end

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
