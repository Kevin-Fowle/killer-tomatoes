Rails.application.routes.draw do
  get 'welcome/index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'movies#index'

  resources :movie, only: [:show]

end
