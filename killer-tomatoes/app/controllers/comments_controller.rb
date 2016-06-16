class CommentsController < ActionController::Base
  def new
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
      redirect_to(@movie)
    else
      render 'new'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
