Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :categories, only: :show
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
