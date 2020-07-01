# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
recipes = [
  { name: 'Ham Sandwich', difficulty: :easy, preparation_time: '30 minutes', cooking_time: '40 minutes', system_of_measurement: :metric, steps: 'step1-Grab 2 bits of bread-step2-Grab 2 slices of ham-step3-Add the slices of ham between the 2 slices of bread-step4-Enjoy!', comments: 'A simple bread based sandwich' },
]

recipe_ingredients = [
  { name: 'Ham Sandwich', ingredients: [Ingredient.find_by_name('ham'), Ingredient.find_by_name('bread')] }
]

puts '#####################################################################################################'
puts 'Seeding Recipes...'
puts '#####################################################################################################'

recipes.each_with_index do |recipe, index|
  puts "Creating #{recipe[:name]} ...", "\n"
  user = User.first
  recipe_instance = user.recipes.create(recipe)
  recipe_instance.ingredients << recipe_ingredients[index][:ingredients]
  puts recipe, "\n"
  puts "#{recipe[:name]} created"
end

puts '#####################################################################################################'
puts 'Recipes seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength