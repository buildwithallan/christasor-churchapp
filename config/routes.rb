Rails.application.routes.draw do

  
  devise_for :users
  get 'dashboard/index'
  root 'dashboard#index'
  resources :tithes
  resources :groups
  resources :member_groups

  resources :departments
  resources :memberships
  resources :branches
  #resources :contributions
  resources :contributions do
  collection do
    match 'search' => 'contributions#search', via: [:get, :post], as: :search
  end
end
  resources :offertories
  resources :expenses
  
end