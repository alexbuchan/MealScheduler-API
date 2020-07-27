# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
measure_unit_types = [
  { unit_type: 'weight' },
  { unit_type: 'volume' },
]

puts '#####################################################################################################'
puts 'Seeding Units of Measure Types...'
puts '#####################################################################################################'

measure_unit_types.each_with_index do |unit_type|
  puts "Creating #{unit_type[:unit_type]} ...", "\n"
  MeasureUnitType.create(unit_type)
  puts unit_type, "\n"
  puts "#{unit_type[:unit_type]} created"
end

puts '#####################################################################################################'
puts 'Units of Measure Types seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength
