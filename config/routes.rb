Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :crops, only: [:index, :show]
  resources :gardens, only: [:show, :index, :new, :create] do
    resources :plots, only: [:new, :create]
  end
end
