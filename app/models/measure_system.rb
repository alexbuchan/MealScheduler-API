# frozen_string_literal: true

# MeasureSystem
class MeasureSystem < ApplicationRecord
  has_many :recipes
  has_and_belongs_to_many :measure_units
end
