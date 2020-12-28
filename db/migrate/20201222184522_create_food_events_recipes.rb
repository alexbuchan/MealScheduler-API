class CreateFoodEventsRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :food_events_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :food_event, index: true
    end
  end
end
