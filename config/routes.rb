Rails.application.routes.draw do
  resources :groups
  resources :departments
  resources :memberships
  resources :branches
end
