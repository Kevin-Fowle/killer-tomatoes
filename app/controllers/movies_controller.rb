class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def new
  end

  def create
  end

end
