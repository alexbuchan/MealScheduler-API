ActiveAdmin.register Recipe do
  permit_params :name, :steps, :comments, :preparation_time, :cooking_time, :difficulty, :system_of_measurement, :user_id
end
