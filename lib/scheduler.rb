class Scheduler
  def initialize(params)
    @month = params[:month]
    @year = params[:year]
    @begin_date = Date.parse("#{@month} #{@year}")
    @end_date = @begin_date.end_of_month
  end

  def get_all_events_by_month
    month_numeric = month_to_numeric(@month)
    Event.all.where('extract(month from date) = ?', month_numeric).where('extract(year from date) = ?', @year)
  end

  def amount_of_days_in_month
    month_numeric = month_to_numeric(@month)
    Time::COMMON_YEAR_DAYS_IN_MONTH[month_numeric]
  end

  def as_json(options = {})
    json = {}
    json['month'] = @month
    json['year'] = @year
    json['number_of_days'] = amount_of_days_in_month
    json['events'] = get_all_events_by_month
    json.to_json
  end

  private 

  def month_to_numeric(month)
    Date::MONTHNAMES.find_index(month)
  end
end