Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users
  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only: :create
    resources :groups, only: :create do
      resources :messages, only: [:index, :create]
    end
  end
  resources :users, only: [:show, :index, :edit, :update]
  resources :groups, only: :index
  end
