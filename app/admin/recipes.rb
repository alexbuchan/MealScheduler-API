ActiveAdmin.register Recipe do
  permit_params :name, :steps, :comments, :preparation_time, :cooking_time, :difficulty, :measure_system_id, :user_id, recipe_ingredients_attributes: [ :ingredient_id, :amount, :measure_unit_id ]

  form do |f|
    f.inputs "Recipe" do
      f.input :name
      f.input :user
      f.input :measure_system
      f.input :difficulty
      f.input :preparation_time, :as => :time_picker, :step => :quarter_hour
      f.input :cooking_time, :as => :time_picker
      f.input :steps
      f.input :comments

      f.inputs 'Ingredients' do
        f.has_many :recipe_ingredients, new_record: 'Add Ingredient', heading: '' do |i|
          i.input :ingredient
          i.input :amount
          i.input :measure_unit
        end
      end

      f.actions
    end
  end

  show do
    attributes_table do
      row :title
      row :user
      row :event_type
      row :date
      row :begin_at
      row :end_at
      row :comments
      panel "Ingredients" do
        table_for recipe.recipe_ingredients do
          column :ingredient
          column :amount
          column :measure_unit
        end
      end
    end
  end
end
