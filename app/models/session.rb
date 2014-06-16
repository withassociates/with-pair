class Session < ActiveRecord::Base
  BOOKABLE = :bookable
  BOOKED = :booked

  belongs_to :person
  has_many :bookings, dependent: :destroy

  validates :person, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def self.upcoming
    where(['starts_at >= ?', Time.now]).order('starts_at ASC')
  end

  def self.past
    where(['starts_at < ?', Time.now]).order('starts_at DESC')
  end

  def state
    if bookings.active.any?(&:persisted?)
      BOOKED
    else
      BOOKABLE
    end
  end

  def bookable?
    state == BOOKABLE
  end

  def booking
    bookings.active.first
  end
end
