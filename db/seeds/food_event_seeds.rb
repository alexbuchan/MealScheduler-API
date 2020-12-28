# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
food_events = [
  { title: "Breakfast at Tiffany's", eventable_id: 1, eventable_type: 'FoodEvent', date: (DateTime.now), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", eventable_id: 2, eventable_type: 'FoodEvent', date: (DateTime.now), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Breakfast at Tiffany's", eventable_id: 3, eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", eventable_id: 4, eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Snappy Snack", eventable_id: 5, eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '17:30', end_at: '17:45', comments: 'Pretty snappy, no time but to snack', food_event_attributes: { recipe_id: 2 } },
  { title: "Dinner in hell", eventable_id: 6, eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...', food_event_attributes: { recipe_id: 2 } },
  { title: "Breakfast at Tiffany's", eventable_id: 7, eventable_type: 'FoodEvent', date: (DateTime.now + 2.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", eventable_id: 8, eventable_type: 'FoodEvent', date: (DateTime.now + 2.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Dinner in hell", eventable_id: 9, eventable_type: 'FoodEvent', date: (DateTime.now + 2.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...', food_event_attributes: { recipe_id: 2 } },
  { title: "Breakfast at Tiffany's", eventable_id: 10, eventable_type: 'FoodEvent', date: (DateTime.now + 8.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", eventable_id: 11, eventable_type: 'FoodEvent', date: (DateTime.now + 8.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Breakfast at Tiffany's", eventable_id: 12, eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", eventable_id: 13, eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Snappy Snack", eventable_id: 14, eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '17:30', end_at: '17:45', comments: 'Pretty snappy, no time but to snack', food_event_attributes: { recipe_id: 2 } },
  { title: "Dinner in hell", eventable_id: 15, eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...', food_event_attributes: { recipe_id: 2 } },
  { title: "Breakfast at Tiffany's", eventable_id: 16, eventable_type: 'FoodEvent', date: (DateTime.now + 17.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast', food_event_attributes: { recipe_id: 1 } },
  { title: "Luncheon with the Famous Five", eventable_id: 17, eventable_type: 'FoodEvent', date: (DateTime.now + 17.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch', food_event_attributes: { recipe_id: 3 } },
  { title: "Dinner in hell", eventable_id: 18, eventable_type: 'FoodEvent', date: (DateTime.now + 17.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...', food_event_attributes: { recipe_id: 2 } }
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