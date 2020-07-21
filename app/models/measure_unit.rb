# frozen_string_literal: true

# MeasureUnit
class MeasureUnit < ApplicationRecord
  has_and_belongs_to_many :measure_systems

  validates :name, presence: true
end
