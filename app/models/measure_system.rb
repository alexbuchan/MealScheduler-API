class MeasureSystem < ApplicationRecord
  has_and_belongs_to_many :measure_units
end
