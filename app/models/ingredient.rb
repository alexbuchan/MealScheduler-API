# frozen_string_literal: true

# Ingredient
class Ingredient < ApplicationRecord
  belongs_to :measure_unit_type
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
end
