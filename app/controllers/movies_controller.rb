class MoviesController < ApplicationController

  before_filter 'authorize', :only => [:new, :show]

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
    @movie_info = get_movie_info(params[:title])
    @movie = Movie.new(title: @movie_info["Title"],
                       genre: @movie_info["Genre"],
                       description: @movie_info["Plot"])
    p @movie_info                   
    if request.xhr?
      content_type :json
      { title: @movie_info["Title"],
        genre: @movie_info["Genre"],
        description: @movie_info["Plot"]}.to_json
      else
        redirect_to root_path
      end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :image, :description, :genre)
  end
end
