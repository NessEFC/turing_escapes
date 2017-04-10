Rails.application.routes.draw do

  resources :escapes, only: [:index]

  get '/:category_name', to: 'categories#index'

end
