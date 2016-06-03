Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:edit, :show, :update]

  resources :prototypes do
    scope module: :prototypes do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end

