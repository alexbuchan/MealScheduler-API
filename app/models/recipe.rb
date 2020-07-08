class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_events
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_and_belongs_to_many :shopping_events, join_table: 'shopping_events_recipes'

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
end
