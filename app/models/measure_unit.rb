class MeasureUnit < ApplicationRecord
  has_and_belongs_to_many :measure_systems
end
