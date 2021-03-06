# frozen_string_literal: true

# Recipe
class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :measure_system
  has_many :food_events
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_and_belongs_to_many :shopping_events, join_table: 'shopping_events_recipes'

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  accepts_nested_attributes_for :measure_system

  validates :name, :steps, :preparation_time, :cooking_time, :difficulty, :measure_system, presence: true
  validates :name, length: { minimum: 3 }

  def as_json(options = {})
    json = {}
    json['id'] = id
    json['name'] = name
    json['steps'] = steps
    json['preparation_time'] = preparation_time
    json['cooking_time'] = cooking_time
    json['difficulty'] = difficulty
    json['measure_system'] = measure_system.name
    json['comments'] = comments
    json['user_id'] = user_id
    json['created_at'] = created_at
    json['updated_at'] = updated_at
    json['recipe_ingredients'] = recipe_ingredients
    json
  end
end
