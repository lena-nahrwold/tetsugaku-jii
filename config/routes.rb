Rails.application.routes.draw do
  root to: 'search#home'

  devise_for :users
  resources :users
  
end
