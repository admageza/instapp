class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    comment = current_user.comments.create(post_id: params[:post_id])
    redirect_to post_path(@post), notice:"You have commented #{comment.post.user.name}'s post"
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    comment = current_user.comments.find_by(post_id: params[:post_id])
    redirect_to post_path(@post), notice: "#{comment.post.user.name}'s post is deleted"
  end
 
  private
    def comment_params
      params.require(:comment).permit(:image, :commenter, :body)
    end
end
