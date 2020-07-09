Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post 'users/register'
  post 'users/login', as: 'login'

  resources :recipes
  resources :events
  resources :scheduler, only: [:create]
  resources :shopping_lists, only: [:create]
end
