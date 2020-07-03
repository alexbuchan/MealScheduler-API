Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post 'users/register'
  post 'users/login', as: 'login'

  resources :recipes
end
