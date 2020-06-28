class CreateShoppingEventsRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_events_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :shopping_event, index: true
    end
  end
end
