Rails.application.routes.draw do
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
    resources :activities do
      resources :activity_submissions
    end
  end

  get '/profile', to: 'profiles#index'
  get '/feed', to: 'profiles#feed'
  post 'create2', to: 'posts#create2'
  post 'create_2', to: 'comments#create2'
  devise_scope :user do
    get "/sign_out" => "users/sessions#destroy" 
    authenticated :user do
      namespace :users do
        get 'classes/index', as: :classes
      end
    end
  end

  root :to => "groups#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'classpage', to: 'html_pages#classpage'
end
