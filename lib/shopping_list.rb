class ShoppingList
  def initialize(params)
    @begin_date = Date.parse(params[:date_range][0])
    @end_date = Date.parse(params[:date_range][1])

    build
  end

  def build
    ingredients = get_ingredients
    calculate_ingredient_amounts(ingredients)
  end

  def get_ingredients
    food_events = FoodEvent.all.where(date: @start..@end)
    recipes = food_events.map { |food_event| food_event.recipe }
    recipe_ingredients = recipes.map { |recipe| recipe.recipe_ingredients }.flatten
    ingredients = recipe_ingredients.map do |recipe_ingredient|
      { 
        name: recipe_ingredient.ingredient.name,
        amount: recipe_ingredient.amount,
        unit_of_measurement: recipe_ingredient.unit_of_measurement,
        recipe: recipe_ingredient.recipe
      }
    end

    ingredients
  end

  def calculate_ingredient_amounts(ingredients)
    shopping_list = []
    ingredients.each do |ingredient|
      if in_shopping_list?(shopping_list, ingredient)
        shopping_list_ingredient = shopping_list.select { |shopping_list_ingredient| shopping_list_ingredient[:name] == ingredient[:name] }[0]
        shopping_list_ingredient[:amount] += ingredient[:amount]
      else
        shopping_list.push(ingredient)
      end
    end

    shopping_list
  end

  private

  def in_shopping_list?(shopping_list, ingredient)
    !(shopping_list.select { |shopping_list_ingredient| shopping_list_ingredient[:name] == ingredient[:name] }[0].nil?)
  end
end

# date_range = [Date.parse('05-07-2020'), Date.parse('29-07-2020')]
# shopping_list = ShoppingList.new([])
# x = shopping_list.build
# x.each { |ingredient| print ingredient[:name], ": ", ingredient[:amount], " ", ingredient[:unit_of_measurement], "\n" }
# x.each {|i| puts i.name}