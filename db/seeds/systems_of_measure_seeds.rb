# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
systems_of_measure = [
  { name: 'metric' },
  { name: 'imperial' },
  { name: 'us customary' }
]

puts '#####################################################################################################'
puts 'Seeding Systems of Measure...'
puts '#####################################################################################################'

systems_of_measure.each do |system|
  puts "Creating #{system[:name]} ...", "\n"
  MeasureSystem.create(system)
  puts system, "\n"
  puts "#{system[:name]} created"
end

puts '#####################################################################################################'
puts 'Systems of Measure seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength