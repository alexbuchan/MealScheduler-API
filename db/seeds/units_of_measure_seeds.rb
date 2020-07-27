# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
measure_units = [
  # Metric
  { name: 'gram' },
  { name: 'kilogram' },
  { name: 'milliliter' },
  { name: 'liter' },

  # Shared Avoirdupoid
  { name: 'grain' },
  { name: 'ounce' },
  { name: 'dram' },
  { name: 'pound' },
  
  # Imperial
  { name: 'stone' },

  { name: 'fluid ounce' },
  { name: 'gill' },
  { name: 'pint' },

  # US Customary
  { name: 'teaspoon' },
  { name: 'tablespoon' },
  { name: 'us fluid ounce' },
  { name: 'us shot' },
  { name: 'us gill' },
  { name: 'us cup' },
  { name: 'us pint' }
]

measure_systems_units = [
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
