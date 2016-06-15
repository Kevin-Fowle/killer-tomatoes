Rails.application.routes.draw do
  resources :user
  resources :sessions, only: [:new, :create, :destroy]


  resources :movies, only: [:show]
  root 'movies#index'

end
