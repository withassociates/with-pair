class Session < ActiveRecord::Base
  BOOKABLE = :bookable
  UNAVAILABLE = :unavailable

  belongs_to :person
  has_many :bookings

  def self.upcoming
    where("starts_at > NOW()")
  end

  def state
    if bookings.empty?
      BOOKABLE
    else
      UNAVAILABLE
    end
  end

  def bookable?
    state == BOOKABLE
  end
end
