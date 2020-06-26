class CreateFoodEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :food_events do |t|
      t.integer :recipe_id
    end
  end
end
