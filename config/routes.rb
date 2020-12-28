Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'admin/dashboard#index'

  post 'users/register'
  post 'users/login', as: 'login'
  post 'recipes/recipe_images_upload', as: 'recipe_images_upload'
  get 'event_types', to: 'events#event_types'

  resources :events
  resources :ingredients
  resources :recipes
  resources :date_frequencies, only: [:index]
  resources :scheduler, only: [:create]
  resources :shopping_lists, only: [:create]
end
