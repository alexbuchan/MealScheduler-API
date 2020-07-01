# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
ingredients = [
  { name: 'ham' },
  { name: 'cheese' },
  { name: 'bread' },
  { name: 'wrap' },
  { name: 'brown rice' },
  { name: 'avocado' },
  { name: 'potato' },
  { name: 'onion' },
  { name: 'lemon' },
  { name: 'cilantro' },
  { name: 'red pepper' },
  { name: 'green pepper' },
  { name: 'chicken' },
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