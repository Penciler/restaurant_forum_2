Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  #resources :restaurants, only: [:index, :show]
  resources :categories, only: :show

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
    end

    member do
      get :dashboard
      post :favorite
      post :unfavorite
      post :like
      post :unlike
    end

  end

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :friend_list
    end
  end

  resources :followships, only: [:create, :destroy]

  resources :friendships, only: [:create, :destroy]


  namespace :admin do
    resources :restaurants
    resources :categories 
    root "restaurants#index"
  end
end
