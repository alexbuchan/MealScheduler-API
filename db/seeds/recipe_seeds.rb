# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
recipes = [
  { name: 'Ham Sandwich', difficulty: :easy, preparation_time: '30 minutes', cooking_time: '40 minutes', system_of_measurement: :metric, steps: 'step1-Grab 2 bits of bread-step2-Grab 2 slices of ham-step3-Add the slices of ham between the 2 slices of bread-step4-Enjoy!', comments: 'A simple bread based sandwich' },
]

recipe_ingredients = [
  { name: 'Ham Sandwich', ingredients: [{ ingredient: Ingredient.find_by_name('ham'), amount: 50, unit_of_measurement: 'gram' }, { ingredient: Ingredient.find_by_name('bread'), amount: 50, unit_of_measurement: 'gram' }] }
]

puts '#####################################################################################################'
puts 'Seeding Recipes...'
puts '#####################################################################################################'

recipes.each_with_index do |recipe, index|
  puts "Creating #{recipe[:name]} ...", "\n"
  user = User.first
  recipe_instance = user.recipes.create(recipe)
  recipe_ingredients[index][:ingredients].each do |ingredient|
    recipe_ingredient = RecipeIngredient.new(recipe_id: recipe_instance.id, ingredient_id: ingredient[:ingredient].id, amount: ingredient[:amount], unit_of_measurement: ingredient[:unit_of_measurement])
    recipe_ingredient.save
  end
  puts recipe, "\n"
  puts "#{recipe[:name]} created"
end

puts '#####################################################################################################'
puts 'Recipes seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength