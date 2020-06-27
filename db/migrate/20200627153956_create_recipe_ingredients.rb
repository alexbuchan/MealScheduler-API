class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe
      t.references :ingredient
      t.integer :amount

      t.timestamps
    end
  end
end
