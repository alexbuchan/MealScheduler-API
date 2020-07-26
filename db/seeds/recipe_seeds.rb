# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

ingredients = {
  ham: Ingredient.find_by_name('ham'),
  cheese: Ingredient.find_by_name('cheese'),
  bread: Ingredient.find_by_name('bread'),
  wrap: Ingredient.find_by_name('wrap'),
  onion: Ingredient.find_by_name('onion'),
  rice: Ingredient.find_by_name('rice'),
  kidney_beans: Ingredient.find_by_name('kidney beans'),
  garlic: Ingredient.find_by_name('garlic'),
  red_pepper: Ingredient.find_by_name('red pepper'),
  green_pepper: Ingredient.find_by_name('green pepper'),
  chicken: Ingredient.find_by_name('chicken'),
  avocado: Ingredient.find_by_name('avocado'),
  tomato: Ingredient.find_by_name('tomato'),
  lemon: Ingredient.find_by_name('lemon')
}

measure_systems = {
  metric: MeasureSystem.find_by_name(:metric)
}

recipes = [
  { name: 'Ham Sandwich', difficulty: :easy, preparation_time: '5 minutes', cooking_time: '0 minutes', measure_system: measure_systems[:metric], steps: 'step1-Grab 2 bits of bread-step2-Grab 2 slices of ham-step3-Add the slices of ham between the 2 slices of bread-step4-Enjoy!', comments: 'A simple bread based sandwich' },
  { name: 'Cheese Sandwich', difficulty: :easy, preparation_time: '5 minutes', cooking_time: '0 minutes', measure_system: measure_systems[:metric], steps: 'step1-Grab 2 bits of bread-step2-Cut 2 slices of cheese-step3-Add the slices of cheese between the 2 slices of bread-step4-Enjoy!', comments: 'A simple bread based sandwich' },
  { name: 'Fajitas', difficulty: :medium, preparation_time: '20 minutes', cooking_time: '30 minutes', measure_system: measure_systems[:metric], steps: "step1-Make the frijoles in a frying pan, with the onion and garlic.-step2-While making the frijoles also make the filling by adding onions, peppers, chicken and whatever sauce you want to add-step3-Don't forget to boil some rice-step4-While everything is cooking, make the guacamole.-step5-When everything is done, serve in a different dishes, and quantities to your satisfaction in the wraps. Grated cheese and lemon is also highly recommended as a garnish.", comments: 'A simple recipe to make mexican fajitas' }
]

recipe_ingredients = [
  [
    { ingredient_id: ingredients[:ham].id, amount: 50, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:bread].id, amount: 75, unit_of_measurement: 'gram' }
  ],
  [
    { ingredient_id: ingredients[:cheese].id, amount: 50, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:bread].id, amount: 75, unit_of_measurement: 'gram' }
  ],
  [
    { ingredient_id: ingredients[:wrap].id, amount: 20, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:cheese].id, amount: 20, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:onion].id, amount: 400, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:rice].id, amount: 20, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:kidney_beans].id, amount: 20, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:garlic].id, amount: 10, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:red_pepper].id, amount: 100, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:green_pepper].id, amount: 100, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:chicken].id, amount: 500, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:avocado].id, amount: 20, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:tomato].id, amount: 20, unit_of_measurement: 'gram' },
    { ingredient_id: ingredients[:lemon].id, amount: 10, unit_of_measurement: 'gram' }
  ]
]

puts '#####################################################################################################'
puts 'Seeding Recipes...'
puts '#####################################################################################################'

recipes.each_with_index do |recipe, index|
  puts "Creating #{recipe[:name]} ...", "\n"
  user = User.first
  recipe_instance = user.recipes.create(recipe)
  recipe_ingredients[index].each do |ingredient|
    recipe_ingredient = RecipeIngredient.new(recipe_id: recipe_instance.id, ingredient_id: ingredient[:ingredient_id], amount: ingredient[:amount], unit_of_measurement: ingredient[:unit_of_measurement])
    recipe_ingredient.save
  end
  puts recipe, "\n"
  puts "#{recipe[:name]} created"
end

puts '#####################################################################################################'
puts 'Recipes seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength