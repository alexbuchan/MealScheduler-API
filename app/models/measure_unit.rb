# frozen_string_literal: true

# MeasureUnit
class MeasureUnit < ApplicationRecord
  has_many :recipe_ingredients
  has_and_belongs_to_many :measure_systems
  belongs_to :measure_unit_type

  validates :name, presence: true
end
