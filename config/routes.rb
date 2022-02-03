Rails.application.routes.draw do
  get 'classes/index'
  get 'activity/index'

  resources :comments

  devise_for :users 
  resources :groups do
    resources :class_students
    resources :assignments do
      resources :assignment_submissions 
    end
  end

  resources :posts
  get '/home', to: 'home#index'

  devise_scope :user do
    get "/sign_out" => "users/sessions#destroy" 
    authenticated :user do
      namespace :users do
        resources :activities
        get 'classes/index', as: :classes
      end
    end
  end

  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'classpage', to: 'html_pages#classpage'
end
