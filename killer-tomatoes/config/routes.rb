Rails.application.routes.draw do



  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  resources :movies, only: [:show] do
    resources :reviews, only: [:show, :new, :create] do
      resources :comments, only: [:new, :create]
    end


  end
  root 'movies#index'

end
