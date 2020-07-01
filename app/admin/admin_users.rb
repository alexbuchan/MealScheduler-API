# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  actions :all

  permit_params :email, :password, :password_digest

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  index do
    selectable_column
    column :id
    column :email
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end
end
