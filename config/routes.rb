Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:edit, :show, :update]
  resources :prototypes, only: [:index, :show, :new, :create]
end

