class ReadonlyUsersController < ApplicationController
  def index
  	@users=User.user
  end
  def show
  	@user= User.where(username:params[:username]).first
  	@fav_movies = @user.movies
  end
end
