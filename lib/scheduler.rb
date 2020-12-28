class Scheduler
  def initialize(params)
    @month = params[:month]
    @year = params[:year]
    @begin_date = Date.parse("#{@month} #{@year}")
    @end_date = @begin_date.end_of_month
  end

  def build
    events = get_all_events_by_month
    @schedule = []

    amount_of_days_in_month.times do |day|
      date = Date.parse("#{day + 1}-#{@month}-#{@year}")

      @schedule.push({
        day: date.day,
        day_name: date.strftime("%A"),
        date: date,
        events: find_events_for_day(date, events),
        active: true
      })
    end

    pad_beginning_of_schedule
    pad_end_of_schedule
    @schedule
  end

  def as_json(options = {})
    json = {}
    json['month'] = @month
    json['year'] = @year
    json['number_of_days'] = amount_of_days_in_month
    json['schedule'] = build

    json.to_json
  end

  private

  def find_events_for_day(date, events)
    # SET TO CURRENT USER PLEASE. CURRENTLY SENDING ALL EVENTS, NOT USER SPECIFIC!!
    filtered_events = events.select { |event| event.date == date }
    ActiveModelSerializers::SerializableResource.new(filtered_events, each_serializer: EventSerializer)
  end

  def pad_beginning_of_schedule
    while @schedule[0][:day_name] != 'Monday' do
      yesterday = @schedule[0][:date].yesterday

      @schedule.unshift({
        day: yesterday.day,
        day_name: yesterday.strftime("%A"),
        date: yesterday,
        events: [],
        active: false
      })
    end
  end

  def pad_end_of_schedule
    while @schedule[-1][:day_name] != 'Sunday' do
      tomorrow = @schedule[-1][:date].tomorrow

      @schedule.push({
        day: tomorrow.day,
        day_name: tomorrow.strftime("%A"),
        date: tomorrow,
        events: [],
        active: false
      })
    end
  end

  def get_all_events_by_month
    month_numeric = month_to_numeric(@month)
    Event.all.where('extract(month from date) = ?', month_numeric).where('extract(year from date) = ?', @year)
  end

  def amount_of_days_in_month
    month_numeric = month_to_numeric(@month)
    return 29 if month_numeric == 2 && Date.gregorian_leap?(@year)
    Time::COMMON_YEAR_DAYS_IN_MONTH[month_numeric]
  end

  def month_to_numeric(month)
    Date::MONTHNAMES.find_index(month)
  end
end