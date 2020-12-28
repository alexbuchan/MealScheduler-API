class EventSerializer < ActiveModel::Serializer
  cache key: 'Event'
  attributes :id, :user_id, :title, :date, :event_type, :recipes, :begin_at, :end_at, :comments
  attribute :frequency if :event_type == 'ShoppingEvent'
  attribute :date_range if :event_type == 'ShoppingEvent'

  def recipes
    object.eventable.recipes if event_has_multiple_recipes?
  end

  def event_type
    object.event_type
  end

  def begin_at
    object.begin_at.strftime("%H:%M")
  end

  def end_at
    object.end_at.strftime("%H:%M")
  end

  def date_range
    date_range = [object.date]

    case eventable.date_frequency.name
    when 'DAILY'
      end_date = object.date + 1.day
    when 'WEEKLY'
      end_date = object.date + 1.week
    when 'BIWEEKLY'
      end_date = object.date + 2.weeks
    when 'MONTHLY'
      end_date = object.date + 1.month
    end

    date_range.push(end_date)
    date_range
  end

  private

    def event_has_multiple_recipes?
      object.event_type == 'FoodEvent' || object.event_type == 'ShoppingEvent'
    end
end