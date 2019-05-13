Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get '/users/:id/profile' => 'users/registrations#profile', as: :profile
  end

  resources :users, only: [:show, :edit, :update, :favorite]
  resources :categories, only: :show
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :posts, only: [:new] do
    collection do
      post :preview
      post :new, path: :new, as: :new, action: :back
    end
  end

  resources :feed, only: :index

  get "/users/:id/setting" => "users#setting"
  get '/users/:id/fav' => 'users#favorite'
  get '/ranking' => 'posts#ranking'
  get "/privacy" => "posts#privacy"
  # get '/users/:id/profile' => 'users#profile', as: :profile
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'


end
