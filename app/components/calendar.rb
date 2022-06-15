class Calendar
  attr_accessor :view_context, :options, :data_ordered

  def initialize(view_context, opts = {})
    @view_context = view_context
    @params = view_context.params
    @options = opts
    @data_ordered = order_data_and_group_by_date || {}
  end

  def render(&block)
    view_context.render(
      partial: "components/calendar/index",
      locals: {
        block: block,
        calendar: self,
        date_range: date_range,
      }
    )
  end

  def date_range
    (start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).to_a
  end

  def url_for_next_month
    view_context.url_for(@params.merge(:start_date => (date_range.last + 1.day).iso8601).permit(:start_date))
  end

  def url_for_previous_month
    view_context.url_for(@params.merge(:start_date => (date_range.first - 1.day).iso8601).permit(:start_date))
  end

  def attribute_order
    options.fetch(:attribute, :date)
  end

  def order_data_and_group_by_date
    events = options.fetch(:data, []).reject { |e| e[attribute_order].nil? }.sort_by(&attribute_order)
    events_grouped_by_date = Hash.new { |h, k| h[k] = [] }
    events.each do |event|
      date = event.send(attribute_order).to_date
      events_grouped_by_date[date] << event
    end
    events_grouped_by_date
  end

  def start_date
    (@params[:start_date] || Date.current).to_date
  end

  def day_classes(day)
    classes = ["day"]
    classes << "out-of-month" if start_date.month != day.month
    classes << "current-date" if Date.current == day
    classes.join " "
  end
end
