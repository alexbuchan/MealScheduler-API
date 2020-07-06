# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
event_types = [
  { name: 'BREAKFAST' },
  { name: 'LUNCH' },
  { name: 'DINNER' },
  { name: 'SNACK' },
  { name: 'COOKING' },
  { name: 'SHOPPING' },
]

puts '#####################################################################################################'
puts 'Seeding Event Types...'
puts '#####################################################################################################'

event_types.each do |event_type|
  puts "Creating #{event_type[:name]} ...", "\n"
  EventType.create(event_type)
  puts event_type, "\n"
  puts "#{event_type[:name]} created"
end

puts '#####################################################################################################'
puts 'Event Types seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength