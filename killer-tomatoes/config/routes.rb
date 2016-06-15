Rails.application.routes.draw do

  get 'welcome/index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  resources :movies, only: [:show] do
    resources :reviews, only: [:show, :new, :create]
  end
  root 'movies#index'

end
