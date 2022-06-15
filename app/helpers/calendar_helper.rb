module CalendarHelper
  def calendar(options = {}, &block)
    Calendar.new(self, options).render(&block)
  end
end
