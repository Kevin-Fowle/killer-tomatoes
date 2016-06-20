Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  resources :movies, only: [:show, :new, :create] do
    resources :reviews, only: [:show, :new, :create] do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
      end
        resources :comments, only: [:new, :create]
    end


  end
  root 'movies#index'


  get '/genres/:genre_name', to: 'genres#show', as: 'genre'
  post '/genres/search', to: "genres#search"

end
