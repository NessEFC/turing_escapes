Rails.application.routes.draw do
  root to: 'escapes#index'
  resources :escapes, only: [:index, :show]

  resource :cart, only: [:show, :update, :create, :destroy]

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  get '/dashboard', to: 'users#dashboard'

  get '/:category_name', to: 'categories#index'
end
