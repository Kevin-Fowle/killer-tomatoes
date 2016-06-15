class ReviewsController < ApplicationController

  def new
  end

  def create
    review = Review.new(params[:review])
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
end
