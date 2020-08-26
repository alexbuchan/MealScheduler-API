Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'admin/dashboard#index'

  post 'users/register'
  post 'users/login', as: 'login'

  resources :ingredients
  resources :recipes
  resources :events
  resources :event_types, only: [:index]
  resources :date_frequencies, only: [:index]
  resources :scheduler, only: [:create]
  resources :shopping_lists, only: [:create]
end
