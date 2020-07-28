# frozen_string_literal: true

# Event
class Event < ApplicationRecord
  belongs_to :user
  belongs_to :event_type
  has_one :food_event
  has_one :shopping_event

  accepts_nested_attributes_for :food_event
  accepts_nested_attributes_for :shopping_event

  validates :title, :date, :begin_at, :end_at, presence: true
  validates :title, length: { minimum: 3 }
  validate :date_not_in_past?
  validate :begin_at_not_in_end_at_future?
  validate :end_at_not_in_past_or_begin_at_past?

  def as_json(options = {})
    json = super(options).merge(event_type_as_json)
    json['event_type'] = event_type.name
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

  private

  def date_not_in_past?
    errors.add(:date, "Can't be in the past") if date.past?
  end

  def begin_at_not_in_end_at_future?
    errors.add(:begin_at, "Can't be in your end at's future") if begin_at > end_at
  end

  def end_at_not_in_past_or_begin_at_past?
    errors.add(:end_at, "Can't be in your begin at's past") if end_at < begin_at
  end
end
