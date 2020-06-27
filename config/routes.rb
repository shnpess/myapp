Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :groups, only: :create do
      resources :messages, only: [:index, :create]
      namespace :api do
        resources :messages, only: :index, defaults: { format: 'json' }
      end
    end
  end
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resources :groups, only: [:index, :destroy]
  resources :helps, only: :index
  post '/top/guest_sign_in', to: 'top#new_guest'
end
