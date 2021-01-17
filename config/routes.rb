Rails.application.routes.draw do
  resources :tithes
  resources :groups
  resources :departments
  resources :memberships
  resources :branches
end