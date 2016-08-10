Rails.application.routes.draw do
  resources :product_types
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :users

  #get 'users/new'

  root to: 'visitors#index'
end
