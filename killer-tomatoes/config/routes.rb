Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  resources :movies, only: [:show] do
    resources :reviews, only: [:show, :new, :create] do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
      end
        resources :comments, only: [:new, :create]
    end


  end
  root 'movies#index'

  resources :reviews do

  end
end
