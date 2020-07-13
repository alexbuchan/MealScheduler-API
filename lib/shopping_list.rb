class ShoppingList
  def initialize(user, params)
    binding.pry
    @user = user
    @begin_date = Date.parse(params[:date_range][0])
    @end_date = Date.parse(params[:date_range][1])
    @extra_ingredients = params[:extra_ingredients]
    # Account Settings will include extra ingredients that a user can set as frequently bought. These will also act as extra_ingredients
    # @user_custom_ingredients = user.account_settings

    build
  end

  # IN :=> nil
  # OUT:=> <array[<hash>]>
  # Description :=> Builds an array representing a shopping list filled with ingredient hashes. Adds extra ingredients to the shopping list.
  def build
    ingredients = get_ingredients
    shopping_list = calculate_ingredient_amounts(ingredients)

    format_extra_ingredients
    shopping_list + @extra_ingredients
  end

  private

  # IN :=> nil
  # OUT:=> <array[<hash>]>
  # Description :=> Finds all ingredients belonging all food events within the date range given.
  def get_ingredients
    events = @user.events.where(event_type_id: 1).where(date: @begin_date..@end_date)
    food_events = events.map { |event| event.food_event }
    recipes = food_events.map { |food_event| food_event.recipe }
    recipe_ingredients = recipes.map { |recipe| recipe.recipe_ingredients }.flatten
    ingredients = format_ingredients(recipe_ingredients)

    ingredients
  end

  # IN :=> <array[<hash>]>
  # OUT:=> <array[<hash>]>
  # Description :=> Adds all repeated ingredients together. Pushes non repeated ingredients to the shopping list
  def calculate_ingredient_amounts(ingredients)
    shopping_list = []
    ingredients.each do |ingredient|
      if in_shopping_list?(shopping_list, ingredient)
        shopping_list_ingredient = shopping_list.select { |shopping_list_ingredient| shopping_list_ingredient[:name] == ingredient[:name] }[0]
        shopping_list_ingredient[:amount] += ingredient[:amount]
        shopping_list_ingredient[:recipe_id].push(ingredient[:recipe_id][0])
      else
        shopping_list.push(ingredient)
      end
    end

    shopping_list
  end

  # IN :=> <array[<hash>]>, <hash>
  # OUT:=> <boolean>
  # Description :=> Returns true or false whether an ingredient is in the shopping list
  def in_shopping_list?(shopping_list, ingredient)
    !(shopping_list.select { |shopping_list_ingredient| shopping_list_ingredient[:name] == ingredient[:name] }[0].nil?)
  end

  # IN :=> <array[<RecipeIngredient>]>
  # OUT:=> <hash>
  # Description :=> Formats an array of Recipe Ingredient objects to a hash with exact attributes needed
  def format_ingredients(recipe_ingredients)
    recipe_ingredients.map! do |recipe_ingredient|
      {
        name: recipe_ingredient.ingredient.name,
        amount: recipe_ingredient.amount,
        unit_of_measurement: recipe_ingredient.unit_of_measurement,
        recipe_id: [recipe_ingredient.recipe.id]
      }
    end
  end

  # IN :=> nil
  # OUT:=> <array[<hash>]>
  # Description :=> Formats an array of extra ingredient hashes to a hash with exact attributes needed
  def format_extra_ingredients
    @extra_ingredients
      .map! { |ingredient| ingredient.symbolize_keys }
      .each { |ingredient| ingredient[:recipe_id] = [nil] }
  end
end