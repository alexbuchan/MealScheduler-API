# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
event_types = [
  { event_type: 'BREAKFAST' },
  { event_type: 'LUNCH' },
  { event_type: 'DINNER' },
  { event_type: 'SNACK' },
  { event_type: 'COOKING' },
  { event_type: 'SHOPPING' },
]

puts '#####################################################################################################'
puts 'Seeding Event Types...'
puts '#####################################################################################################'

event_types.each do |event_type|
  puts "Creating #{event_type[:event_type]} ...", "\n"
  EventType.create(event_type)
  puts event_type, "\n"
  puts "#{event_type[:event_type]} created"
end

puts '#####################################################################################################'
puts 'Event Types seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength