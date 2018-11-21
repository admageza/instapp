class FavoritesController < ApplicationController
    before_action :authenticate_user! 

  def create
    @user = current_user.id
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "You liked #{favorite.post.user.name}'s post"
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:post_id]).destroy
    redirect_to posts_url, notice: "#{favorite.post.user.name}'s post is unliked"
  end
  
  def authenticate_user!
    
  end
end
