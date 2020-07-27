# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

measure_unit_types = {
  weight: MeasureUnitType.find_by_unit_type(:weight),
  volume: MeasureUnitType.find_by_unit_type(:volume)
}

measure_units = [
  # Metric
  { name: 'gram', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'kilogram', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'milliliter', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'liter', measure_unit_type_id: measure_unit_types[:volume].id },

  # Shared Avoirdupoid
  { name: 'grain', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'ounce', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'dram', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'pound', measure_unit_type_id: measure_unit_types[:weight].id },
  
  # Imperial
  { name: 'stone', measure_unit_type_id: measure_unit_types[:weight].id },

  { name: 'fluid ounce', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'gill', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'pint', measure_unit_type_id: measure_unit_types[:volume].id },

  # US Customary
  { name: 'teaspoon', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'tablespoon', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'us fluid ounce', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'us shot', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'us gill', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'us cup', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'us pint', measure_unit_type_id: measure_unit_types[:volume].id }
]

measure_systems_units = [
  [1],
  [1],
  [1],
  [1],
  [2, 3],
  [2, 3],
  [2, 3],
  [2, 3],
  [2],
  [2],
  [2],
  [2],
  [3],
  [3],
  [3],
  [3],
  [3],
  [3],
  [3]
]

puts '#####################################################################################################'
puts 'Seeding Units of Measure...'
puts '#####################################################################################################'

measure_units.each_with_index do |unit, index|
  puts "Creating #{unit[:name]} ...", "\n"
  unit_of_measure_instance = MeasureUnit.create(unit)
  unit_of_measure_instance.measure_systems << measure_systems_units[index].map { |id| MeasureSystem.find(id) }
  puts unit, "\n"
  puts "#{unit[:name]} created"
end

puts '#####################################################################################################'
puts 'Units of Measure seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength
