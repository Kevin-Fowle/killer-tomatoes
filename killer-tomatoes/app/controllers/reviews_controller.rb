class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    review = Review.create(review_params)
    if review.save
      redirect_to(@movie)
    else
      render 'new'
    end
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :score, :movie_id)
  end

end
