Rails.application.routes.draw do
  root to: "top#index"
  resources :posts, only: [:index, :new, :create]
  end
