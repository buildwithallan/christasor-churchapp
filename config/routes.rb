Rails.application.routes.draw do

  
  
  
  devise_for :users
  get 'dashboard/index'
  root 'dashboard#index'

  resources :tithes
  resources :groups
  resources :member_groups
  resources :department_members
  resources :departments
  resources :memberships
  resources :branches
  resources :contributions
  resources :offertories
  resources :expenses
  resources :pledges
  
end