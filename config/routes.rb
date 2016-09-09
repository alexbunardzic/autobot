Rails.application.routes.draw do
  resources :messages do
    member do
      get 'categorize'
      get 'associate'
    end
  end
  resources :answers do
    member do
      get 'automatic'
    end
  end
  resources :intents
  resources :contexts
  resources :skus
  resources :context_categories
  resources :conversations do
    collection do
      get 'webhook'
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
