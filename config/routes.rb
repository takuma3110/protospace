Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:edit, :show, :update]
  resources :prototypes

  scope module: :prototypes do
    resources :likes, only: [:create, :destroy]
  end
end

