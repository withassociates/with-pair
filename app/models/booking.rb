class Booking < ActiveRecord::Base
  belongs_to :session
  has_one :person, through: :session

  validates :name, presence: true
  validates :email, presence: true
  validates :project, presence: true, length: { in: 1..140 }

  scope :active, -> { where('cancelled_at IS NULL') }

  def given_name
    name[/\w+/]
  end
end
