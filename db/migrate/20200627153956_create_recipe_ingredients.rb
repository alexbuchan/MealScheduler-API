class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :amount

      t.references :recipe
      t.references :ingredient
      t.references :measure_unit
    end
  end
end
