# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
shopping_events = [
  {
    event_params: { title: "Mercadona Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 1.days), begin_at: '19:00', end_at: '19:30', comments: 'most of our stuff' },
    specific_event_data: { date_frequency_id: 1, recipe_ids: [2, 3] }
  },
  {
    event_params: { title: "Bon Area Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 1.days), begin_at: '19:30', end_at: '19:45', comments: 'tasty stuff for Vannia and I' },
    specific_event_data: { date_frequency_id: 2, recipe_ids: [1, 2] }
  },
  {
    event_params: { title: "Mercadona Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 2.days), begin_at: '19:00', end_at: '19:30', comments: 'most of our stuff' },
    specific_event_data: { date_frequency_id: 1, recipe_ids: [2, 3] }
  },
  {
    event_params: { title: "Bon Area Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 2.days), begin_at: '19:30', end_at: '19:45', comments: 'tasty stuff for Vannia and I' },
    specific_event_data: { date_frequency_id: 2, recipe_ids: [1, 2] }
  },
  {
    event_params: { title: "Mercadona Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 10.days), begin_at: '19:00', end_at: '19:30', comments: 'most of our stuff' },
    specific_event_data: { date_frequency_id: 1, recipe_ids: [2, 3] }
  },
  {
    event_params: { title: "Bon Area Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 10.days), begin_at: '19:30', end_at: '19:45', comments: 'tasty stuff for Vannia and I' },
    specific_event_data: { date_frequency_id: 2, recipe_ids: [1, 2] }
  },
  {
    event_params: { title: "Mercadona Shopping", eventable_type: 'ShoppingEvent', date: (DateTime.now + 17.days), begin_at: '19:00', end_at: '19:30', comments: 'most of our stuff' },
    specific_event_data: { date_frequency_id: 1, recipe_ids: [2, 3] }
  },
]

puts '#####################################################################################################'
puts 'Seeding Shopping Events...'
puts '#####################################################################################################'

user = User.first
shopping_events.each do |event_hash|
  puts "Creating #{event_hash[:event_params][:title]} ...", "\n"

  event = user.events.new(event_hash[:event_params])
  klass = event_hash[:event_params][:eventable_type].constantize
  event.eventable = klass.new(event_hash[:specific_event_data])
  puts event, "\n"

  event.save!

  puts "#{event.title} created"
end

puts '#####################################################################################################'
puts 'Shopping Events seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength