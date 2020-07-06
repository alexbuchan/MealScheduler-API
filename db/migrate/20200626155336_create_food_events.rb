class CreateFoodEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :food_events do |t|
      t.references :recipe, index: true
      t.references :event
    end
  end
end