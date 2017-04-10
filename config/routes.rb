Rails.application.routes.draw do

  resources :escapes, only: [:index]
  
end
