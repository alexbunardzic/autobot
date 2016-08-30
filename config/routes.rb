Rails.application.routes.draw do
  resources :conversations do
    collection do
      post 'webhook'
    end
  end
  get 'static_pages/chat'

  resources :brands
  resources :products
  resources :product_types
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :users

  #get 'users/new'

  root to: 'visitors#index'
end
