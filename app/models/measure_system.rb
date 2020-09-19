# frozen_string_literal: true

# MeasureSystem
class MeasureSystem < ApplicationRecord
  has_many :recipes
  has_and_belongs_to_many :measure_units

  def as_json(options = {})
    json = {}
    json['id'] = id
    json['name'] = name
    json['measure_units'] = measure_units
    json
  end
end
