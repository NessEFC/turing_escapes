Rails.application.routes.draw do
  root to: 'escapes#index'
  resources :escapes, only: [:index, :show]

  resource :cart, only: [:show, :update, :create, :destroy]

  # get '/cart', to: 'carts#index'
  # put '/cart', to: 'carts#update'
  # post '/cart', to: 'carts#create'
  # delete '/cart', to: 'carts#destroy'

  get '/:category_name', to: 'categories#index'
end
