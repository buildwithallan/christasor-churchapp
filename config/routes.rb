Rails.application.routes.draw do
  devise_for :users
  get 'dashboard/index'
  root 'dashboard#index'
  resources :tithes
  resources :groups
  resources :departments
  resources :memberships
  resources :branches
end