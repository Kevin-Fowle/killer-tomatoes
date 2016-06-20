class GenresController < ApplicationController
  def search
    @genre_name = params[:movie][:genre_name].downcase
    redirect_to "/genres/#{@genre_name}"
  end

  def show
    @movies = Movie.where(genre: params[:genre_name])
    @genre = params[:genre_name]
  end
end
