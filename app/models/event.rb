class Event < ApplicationRecord
  belongs_to :user
  has_one :food_event
  has_one :shopping_event
  belongs_to :event_type
  accepts_nested_attributes_for :food_event
  accepts_nested_attributes_for :shopping_event
  accepts_nested_attributes_for :event_type

  def as_json(options = {})
    super(options).merge(event_type_as_json)
  end

  def event_type_as_json
    return { recipe: food_event.recipe } if food_event?
    return { recipes: shopping_event.recipes } if shopping_event?
  end

  def food_event?
    event_type.name == 'FOOD'
  end

  def shopping_event?
    event_type.name == 'SHOPPING'
  end
end
