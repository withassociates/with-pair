class Session < ActiveRecord::Base
  belongs_to :person
  has_many :bookings

  def self.today
    where("starts_at > ? AND ends_at < ?", Time.now, Date.tomorrow)
  end
end
