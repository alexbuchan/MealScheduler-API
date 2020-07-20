# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
shopping_events = [
  { title: "Mercadona Shopping", event_type_id: 3, date: (DateTime.now + 2.days), begin_at: '19:00', end_at: '19:30', comments: 'most of our stuff', shopping_event_attributes: { date_frequency_id: 1, recipe_ids: [2, 3] } },
  { title: "Bon Area Shopping", event_type_id: 3, date: (DateTime.now + 2.days), begin_at: '19:30', end_at: '19:45', comments: 'tasty stuff for Vannia and I', shopping_event_attributes: { date_frequency_id: 2, recipe_ids: [1, 2] } }
]

puts '#####################################################################################################'
puts 'Seeding Shopping Events...'
puts '#####################################################################################################'

user = User.first
shopping_events.each do |shopping_event|
  puts "Creating #{shopping_event[:title]} ...", "\n"
  user.events.create(shopping_event)
  puts shopping_event, "\n"
  puts "#{shopping_event[:title]} created"
end

puts '#####################################################################################################'
puts 'Shopping Events seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength