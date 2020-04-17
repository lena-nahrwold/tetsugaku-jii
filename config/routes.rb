Rails.application.routes.draw do
  root to: 'search#home'

  get '/users/:id/approve', to: 'users#approve', as: :approve_user

  match '/search', to: 'search#home', via: :get
  match '/search', to: 'search#result', via: :post

  match '/details/:word', to: 'search#details', via: :get, as: :details

  devise_for :users
  resources :users

  resources :main_entries, only: [:update]
  resources :sub_entries, only: [:update]

end
