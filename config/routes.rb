Rails.application.routes.draw do
  resources :groups
  resources :users
  devise_for :users 
  get '/profile', to: 'profiles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'profiles#index'
end
