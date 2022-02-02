Rails.application.routes.draw do
  devise_for :users 
  resources :groups do
    resources :class_students
    resources :posts
    resources :comments
  end

  get '/profile', to: 'profiles#index'
  get 'home/index'

  devise_scope :user do
    get "/sign_out" => "users/sessions#destroy" 
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  root :to => "profiles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'classpage', to: 'html_pages#classpage'
end
