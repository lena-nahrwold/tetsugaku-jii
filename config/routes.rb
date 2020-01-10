Rails.application.routes.draw do
  root to: 'search#home'
  
  match '/search', to: 'search#home', via: :get
  match '/search', to: 'search#result', via: :post

  match '/details/:word', to: 'search#details', via: :get, as: :details

  devise_for :users
  resources :users

end
