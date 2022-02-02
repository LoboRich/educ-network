Rails.application.routes.draw do
  get 'activity/index'
  devise_for :users 
  resources :groups do
    resources :class_students
  end

  resources :posts
  get '/home', to: 'home#index'

  devise_scope :user do
    get "/sign_out" => "users/sessions#destroy" 
    authenticated :user do
      namespace :users do
        get 'activity/index', as: :activity
      end
    end
  end

  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'classpage', to: 'html_pages#classpage'
end
