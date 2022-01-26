Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  # devise_scope :user do
  #   authenticated :user do
  #     namespace :users do
  #       , as: :authenticated_root
  #     end
  #   end

  #   root to: 'devise/sessions#new'
  # end

  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
