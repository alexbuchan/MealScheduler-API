# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
measure_unit_types = {
  weight: MeasureUnitType.find_by_unit_type(:weight),
  volume: MeasureUnitType.find_by_unit_type(:volume)
}

ingredients = [
  { name: 'ham', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'cheese', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'bread', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'wrap', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'rice', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'avocado', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'potato', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'tomato', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'onion', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'kidney beans', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'lemon', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'cilantro', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'red pepper', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'green pepper', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'chicken', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'garlic', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'red pepper', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'green pepper', measure_unit_type_id: measure_unit_types[:weight].id },
  { name: 'water', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'milk', measure_unit_type_id: measure_unit_types[:volume].id },
  { name: 'black tea', measure_unit_type_id: measure_unit_types[:weight].id }
]

puts '#####################################################################################################'
puts 'Seeding Ingredients...'
puts '#####################################################################################################'

ingredients.each do |ingredient|
  puts "Creating #{ingredient[:name]} ...", "\n"
  Ingredient.create(ingredient)
  puts ingredient, "\n"
  puts "#{ingredient[:name]} created"
end

puts '#####################################################################################################'
puts 'Ingredients seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength