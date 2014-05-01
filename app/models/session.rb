class Session < ActiveRecord::Base
  BOOKABLE = :bookable
  UNAVAILABLE = :unavailable

  belongs_to :person
  has_many :bookings, dependent: :destroy

  validates :person, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def self.upcoming
    order("starts_at ASC").where("starts_at > NOW()")
  end

  def state
    if bookings.any?(&:persisted?)
      UNAVAILABLE
    else
      BOOKABLE
    end
  end

  def bookable?
    state == BOOKABLE
  end
end
