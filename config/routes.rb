Rails.application.routes.draw do
  resources :activity_submissions
  get 'activity/index'

  devise_for :users 
  resources :groups do
    resources :class_students
    resources :posts do 
      resources :comments
    end
    resources :assignments do
      resources :assignment_submissions 
    end
    resources :activities
  end

  get '/profile', to: 'profiles#index'
  get 'home/index'

  devise_scope :user do
    get "/sign_out" => "users/sessions#destroy" 
    authenticated :user do
      namespace :users do
        get 'classes/index', as: :classes
      end
    end
  end

  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'classpage', to: 'html_pages#classpage'
end
