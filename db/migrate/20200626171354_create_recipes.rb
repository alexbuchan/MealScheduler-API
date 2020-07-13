class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :steps
      t.string :comments
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :difficulty
      t.string :system_of_measurement
      t.references :user
    
      t.timestamps
    end
  end
end
