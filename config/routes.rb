Rails.application.routes.draw do
  get 'users/new'

  root to: 'visitors#index'
end
