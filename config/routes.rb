Rails.application.routes.draw do
  root to: 'escapes#index'
  resources :escapes, only: [:index, :show]


  get '/cart', to: 'carts#index'
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'

  get '/:category_name', to: 'categories#index'
end
