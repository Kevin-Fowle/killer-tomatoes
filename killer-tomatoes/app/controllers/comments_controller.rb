class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @review = Review.find(params[:review_id])
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.build(comment_params)
    @comment.movie = @movie
    @comment.review = @review

    if @comment.save
      redirect_to movie_review_path(@movie, @review)
    else
      @errors = @comment.errors.full_messages
      redirect_to movie_review_path(@movie, @review)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
