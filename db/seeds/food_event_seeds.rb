# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
food_events = [
  {
    event_params: { title: "Breakfast at Tiffany's", eventable_type: 'FoodEvent', date: (DateTime.now), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast' },
    specific_event_data: { recipe_ids: [1] }
  },
  {
    event_params: { title: "Luncheon with the Famous Five", eventable_type: 'FoodEvent', date: (DateTime.now), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch' },
    specific_event_data: { recipe_ids: [3] }
  },
  {
    event_params: { title: "Breakfast at Tiffany's", eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast' },
    specific_event_data: { recipe_ids: [1] }
  },
  {
    event_params: { title: "Luncheon with the Famous Five", eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch' },
    specific_event_data: { recipe_ids: [3] }
  },
  {
    event_params: { title: "Snappy Snack", eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '17:30', end_at: '17:45', comments: 'Pretty snappy, no time but to snack' },
    specific_event_data: { recipe_ids: [2] }
  },
  {
    event_params: { title: "Dinner in hell", eventable_type: 'FoodEvent', date: (DateTime.now + 1.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...' },
    specific_event_data: { recipe_ids: [2] }
  },
  {
    event_params: { title: "Breakfast at Tiffany's", eventable_type: 'FoodEvent', date: (DateTime.now + 2.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast' },
    specific_event_data: { recipe_ids: [1] }
  },
  {
    event_params: { title: "Luncheon with the Famous Five", eventable_type: 'FoodEvent', date: (DateTime.now + 2.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch' },
    specific_event_data: { recipe_ids: [3] }
  },
  {
    event_params: { title: "Dinner in hell", eventable_type: 'FoodEvent', date: (DateTime.now + 2.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...' },
    specific_event_data: { recipe_ids: [2] }
  },
  {
    event_params: { title: "Breakfast at Tiffany's", eventable_type: 'FoodEvent', date: (DateTime.now + 8.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast' },
    specific_event_data: { recipe_ids: [1] }
  },
  {
    event_params: { title: "Luncheon with the Famous Five", eventable_type: 'FoodEvent', date: (DateTime.now + 8.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch' },
    specific_event_data: { recipe_ids: [3] }
  },
  {
    event_params: { title: "Breakfast at Tiffany's", eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast' },
    specific_event_data: { recipe_ids: [1] }
  },
  {
    event_params: { title: "Luncheon with the Famous Five", eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch' },
    specific_event_data: { recipe_ids: [3] }
  },
  {
    event_params: { title: "Snappy Snack", eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '17:30', end_at: '17:45', comments: 'Pretty snappy, no time but to snack' },
    specific_event_data: { recipe_ids: [2] }
  },
  {
    event_params: { title: "Dinner in hell", eventable_type: 'FoodEvent', date: (DateTime.now + 10.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...' },
    specific_event_data: { recipe_ids: [2] }
  },
  {
    event_params: { title: "Breakfast at Tiffany's", eventable_type: 'FoodEvent', date: (DateTime.now + 17.days), begin_at: '9:00', end_at: '9:30', comments: 'One hell of a breakfast' },
    specific_event_data: { recipe_ids: [1] }
  },
  {
    event_params: { title: "Luncheon with the Famous Five", eventable_type: 'FoodEvent', date: (DateTime.now + 17.days), begin_at: '13:00', end_at: '14:00', comments: 'A very misterious lunch' },
    specific_event_data: { recipe_ids: [3] }
  },
  {
    event_params: { title: "Dinner in hell", eventable_type: 'FoodEvent', date: (DateTime.now + 17.days), begin_at: '20:00', end_at: '21:00', comments: 'The Devil has cordiously invited us to dine with him...' },
    specific_event_data: { recipe_ids: [2] }
  }
]

puts '#####################################################################################################'
puts 'Seeding Food Events...'
puts '#####################################################################################################'

user = User.first
food_events.each do |event_hash|
  puts "Creating #{event_hash[:event_params][:title]} ...", "\n"

  event = user.events.new(event_hash[:event_params])
  klass = event_hash[:event_params][:eventable_type].constantize
  event.eventable = klass.new(event_hash[:specific_event_data])
  puts event, "\n"

  event.save!

  puts "#{event.title} created"
end

puts '#####################################################################################################'
puts 'Food Events seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength