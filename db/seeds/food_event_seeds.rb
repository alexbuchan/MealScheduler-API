# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
food_events = [
  { title: "Breakfast at Tiffany's", event_type_id: 1, date: (DateTime.now + 2.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", event_type_id: 1, date: (DateTime.now + 2.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Dinner in hell", event_type_id: 1, date: (DateTime.now + 2.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...', food_event_attributes: { recipe_id: 2 } }
]

puts '#####################################################################################################'
puts 'Seeding Food Events...'
puts '#####################################################################################################'

user = User.first
food_events.each do |food_event|
  puts "Creating #{food_event[:title]} ...", "\n"
  user.events.create(food_event)
  puts food_event, "\n"
  puts "#{food_event[:title]} created"
end

puts '#####################################################################################################'
puts 'Food Events seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength