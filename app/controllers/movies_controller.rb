class MoviesController < ApplicationController
  include MoviesHelper
  before_filter 'authorize', :only => [:new, :create]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie_info = get_movie_info(params[:movie][:title])
    if @movie_info["Response"] == "False" || @movie_info["Type"] != "movie"
        @errors = ["Title Not Found!"]
        render :new
     else
        @movie = Movie.new(title: @movie_info["Title"],
                           genre: @movie_info["Genre"],
                           description: @movie_info["Plot"],
                           image: @movie_info["Poster"])
        if @movie.save
            redirect_to new_movie_review_path(@movie)
          else
            @errors = @movie.errors.full_messages
            render :new
        end
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :image, :description, :genre)
  end
end
