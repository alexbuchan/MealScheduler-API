class Event < ApplicationRecord
  belongs_to :user
  belongs_to :event_type
  has_one :food_event
  has_one :shopping_event

  accepts_nested_attributes_for :food_event
  accepts_nested_attributes_for :shopping_event
  accepts_nested_attributes_for :event_type

  def as_json(options = {})
    json = super(options).merge(event_type_as_json)
    json['begin_at'] = begin_at.strftime("%H:%M")
    json['end_at'] = end_at.strftime("%H:%M")
    json
  end

  def event_type_as_json
    return { recipe: food_event.recipe } if food_event?
    return {
      recipes: shopping_event.recipes,
      frequency: shopping_event.date_frequency.name,
      date_range: calculate_date_range
    } if shopping_event?
  end

  def calculate_date_range
    date_range = [date]

    case shopping_event.date_frequency.name.downcase
    when 'daily'
      end_date = date + 1.day
    when 'weekly'
      end_date = date + 1.week
    when 'biweekly'
      end_date = date + 2.weeks
    when 'monthly'
      end_date = date + 1.month
    end

    date_range.push(end_date)
    date_range
  end

  def food_event?
    event_type.name == 'FOOD'
  end

  def shopping_event?
    event_type.name == 'SHOPPING'
  end
end
