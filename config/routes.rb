Rails.application.routes.draw do
  resources :groups
  devise_for :users 
  get '/profile', to: 'profiles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'profiles#index'

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
