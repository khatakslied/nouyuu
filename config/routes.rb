Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :crops, only: [:index, :show]
  resources :gardens, only: [:show, :index, :new, :create] do
    resources :plots, only: [:new, :create]
  end
end
