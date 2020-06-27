class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_events
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
