module BookingsHelper
  def form_for_booking(&block)
    form_for([@session, @booking], builder: FormBuilder, &block)
  end

  def calendar_event_time(time)
    time.utc.strftime("%d-%m-%Y %H:%M:%S")
  end
end
