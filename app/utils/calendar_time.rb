class CalendarTime
  attr_reader :time

  def initialize(time, zone = Time.zone)
    @time = time.in_time_zone(zone)
  end

  def to_date_format
    case day
    when today
      'Today'
    when tomorrow
      'Tomorrow'
    when yesterday
      'Yesterday'
    when this_saturday...next_saturday
      '%A'
    when next_saturday...week_saturday
      'Next %A'
    when last_saturday...this_saturday
      'Last %A'
    else
      '%A %-d %B'
    end
  end

  def to_time_format
    '%-I:%M%P'
  end

  def to_datetime_format
    to_date_format + ' ' + to_time_format
  end

  private

  def day
    time.beginning_of_day.to_i
  end

  def now
    Time.zone.now
  end

  def today
    now.beginning_of_day.to_i
  end

  def tomorrow
    today + 1.day
  end

  def yesterday
    today - 1.day
  end

  def this_saturday
    now.beginning_of_week(:saturday).to_i
  end

  def next_saturday
    this_saturday + 1.week
  end

  def last_saturday
    this_saturday - 1.week
  end

  def week_saturday
    next_saturday + 1.week
  end
end
