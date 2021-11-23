Rails.application.routes.draw do
  devise_for :users
  root to: 'crops#index'
  resources :crops, only: [:index, :show]
  resources :gardens, only: [:show, :index] do
    resources :plots, only: [:new, :create]
  end
end
