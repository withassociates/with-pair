class Booking < ActiveRecord::Base
  belongs_to :session

  validates :name, presence: true
  validates :email, presence: true
  validates :project, presence: true, length: { in: 70..140 }

  def given_name
    name[/\w+/]
  end
end
