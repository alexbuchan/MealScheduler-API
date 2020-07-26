# frozen_string_literal: true

# RecipeIngredient
class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, dependent: :destroy
  belongs_to :ingredient
  belongs_to :measure_unit

  validates :amount, :measure_unit, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def as_json(options = {})
    json = {}
    json['id'] = id
    json['name'] = ingredient.name
    json['ingredient_id'] = ingredient_id
    json['recipe_id'] = recipe_id
    json['recipe_name'] = recipe.name
    json['amount'] = amount
    json['measure_unit'] = measure_unit.name
    json
  end
end
