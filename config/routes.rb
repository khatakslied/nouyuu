Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :crops, only: [:index, :show] do
    collection do
      get 'favorite'
    end
    member do
      patch 'toggle_favorite', to: "crops#toggle_favorite"
    end
  end
  resources :gardens, only: [:show, :index, :new, :create] do
    resources :plots, only: [:new, :create]
  end
  resources :plots, only: [:update]
end
