module BookingsHelper
  def form_for_booking(&block)
    form_for([@session, @booking], builder: FormBuilder, &block)
  end
end
