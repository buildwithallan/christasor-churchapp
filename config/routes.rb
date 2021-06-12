Rails.application.routes.draw do 
  
  get 'dashboard/index'
  root 'dashboard#index'

  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete "logout", to: 'sessions#destroy'

  resources :tithes
  resources :groups
  resources :member_groups
  resources :department_members
  resources :departments
  resources :memberships
  resources :contributions
  resources :offertories
  resources :expenses
  resources :pledges
  resources :incomes
  resources :users 
  
end