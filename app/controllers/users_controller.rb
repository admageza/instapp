class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
     @favorites_posts = current_user.favorite_posts
     @posts = current_user.posts
  end
  
   def new
    @user = User.new
   end
  
 def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
 end
 
 def edit
    @user = User.find(params[:id])
 end

  private
  def user_params
    params.require(:user).permit(:image, :name, :email, :password,
                                 :password_confirmation)
  end
  
  def favorite
      @favorites_posts = Favorite.find(post_id: params[:post_id])
  end
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
    
  def authorize_user
    redirect_to(current_user) unless @user == current_user
  end
end
