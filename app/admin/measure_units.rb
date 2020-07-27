ActiveAdmin.register MeasureUnit do
  permit_params :name, :measure_unit_type_id

  index do
    selectable_column
    column :id
    column :name
    column :measure_unit_type
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :measure_unit_type
    end
  end
end
