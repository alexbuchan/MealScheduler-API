class MeasureUnitType < ApplicationRecord
  has_many :ingredients
  has_many :measure_units

  validates :unit_type, presence: true
end
