require 'chronic'

class CreateSessions
  def self.perform(day = nil, &block)
    new(day).perform(&block)
  end

  attr_reader :day

  def initialize(day = nil)
    @day = day
  end

  def perform
    people.each_with_index do |person, index|
      starts_at = epoch + index.hours
      ends_at = starts_at + 30.minutes

      session = person.sessions.create(
        starts_at: starts_at,
        ends_at: ends_at
      )

      yield(session) if block_given?
    end
  end

  private

  def people
    Person.all
  end

  def epoch
    if day.present?
      Chronic.parse(day).beginning_of_day
    elsif Time.now.hour <= 9
      Date.today
    else
      Date.tomorrow
    end + 10.hours
  end
end
