# frozen_string_literal: true

# Ingredient
class Ingredient < ApplicationRecord
  belongs_to :measure_unit_type
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true

  def as_json(options = {})
    json = {}
    json['id'] = id
    json['name'] = name
    json['measure_unit_type_id'] = measure_unit_type_id
    json['measure_unit_type'] = measure_unit_type.unit_type
    json
  end
end
