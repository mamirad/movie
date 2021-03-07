class UserApisController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: %i[ mark_as_favourite fav_list_movies user_exist create_user]
  before_action :set_movie, only: %i[ mark_as_favourite ]

def json_request?
    request.format.json?
  end
 def user_exist
    respond_to do |format|
      if @user.present?
        format.json { render json: 'User already exist', status: :ok }
      else
        format.json { render json: 'User not Exist', status: :ok }
      end
    end
 end

 def get_movies_list
    respond_to do |format|
      @movies = Movie.all
      if @movies.present?
        format.json { render json: @movies, status: :ok }
      else
        format.json { render json: 'No Movies available', status: :ok }
      end
    end
 end

 def mark_as_favourite
  respond_to do |format|
    FavouriteMovie.create(user_id:@user.id,movie_id:@movie.id)
    @movie.favorited= @movie.favorited+1
    @movie.save
   format.json { render json: "Mark as Favourite Successfully", status: :ok }

  end
 end

 def fav_list_movies
  respond_to do |format|
    if @user.present?
    @favourite_movies = @user.movies
    if @favourite_movies.present?
    format.json { render json: @favourite_movies, status: :ok }
    else
      format.json { render json: "No Favourite Movies Found", status: :ok }
    end
    else
      format.json { render json: 'User not Exist', status: :ok }
    end
  end
 end



  # POST 
  def create_user
    respond_to do |format|
      if @user.present?
        format.json { render json: 'User already exist', status: :ok }
      else
        unless @user.admin?
          user = User.new(username:params[:username])
          user.save(validate:false)
          format.json { render json: 'New USer Created', status: :ok }
        else
          format.json { render json: 'You are admin', status: :ok }
        end
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
    def set_user
      @user = User.where(username:params[:username]).first
    end

end
