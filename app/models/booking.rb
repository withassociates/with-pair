class Booking < ActiveRecord::Base
  belongs_to :session
  has_one :person, through: :session

  attr_accessor :winnie

  validates :name, presence: true
  validates :email, presence: true
  validates :project, presence: true, length: { in: 1..140 }

  scope :active, -> { where('cancelled_at IS NULL') }
  scope :past, -> { joins(:session).where('sessions.ends_at < NOW()') }

  def given_name
    name[/\w+/]
  end

  def active?
    cancelled_at.nil? && persisted?
  end
end
