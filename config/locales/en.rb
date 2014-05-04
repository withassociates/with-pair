{
  en: {
    time: {
      formats: {
        calendar: -> (time, args) {
          CalendarTime.new(time).to_datetime_format
        }
      }
    }
  }
}
