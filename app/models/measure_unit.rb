# frozen_string_literal: true

# MeasureUnit
class MeasureUnit < ApplicationRecord
  has_many :recipe_ingredients
  has_and_belongs_to_many :measure_systems
  belongs_to :measure_unit_type

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
