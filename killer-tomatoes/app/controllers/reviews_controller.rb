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
    @review = Review.find(params[:id])
    @comments = @review.comments
  end

  def upvote
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.upvote_by current_user
    redirect_to movie_path(@movie)
  end

  def downvote
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.downvote_by current_user
    redirect_to movie_path(@movie)
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :score, :movie_id, :reviewer_id)
  end

end
