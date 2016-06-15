class UsersController < ApplicationController

  before_filter 'authorize', :only => [:edit, :delete]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
