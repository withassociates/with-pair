class Session < ActiveRecord::Base
  BOOKABLE = :bookable
  UNAVAILABLE = :unavailable

  belongs_to :person
  has_many :bookings, dependent: :destroy

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
