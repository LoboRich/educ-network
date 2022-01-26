Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'home/index', as: :authenticated_root
      end
    end

    root to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
