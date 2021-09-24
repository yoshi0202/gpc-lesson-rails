class CommentsController < ApplicationController
  # def create
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     redirect_to post_path(params[:post_id])
  #     return
  #   end
  #   @new_post = Post.new
  #   @new_comment = Comment.new
  #   @post = Post.find(params[:post_id])
  #   @favorites_count = @post.favorites.size
  #   render 'posts/show' 
  # end

  # private
  #   def comment_params
  #     params.require(:comment).permit(:detail).merge(post_id: params[:post_id])
  #   end
end
