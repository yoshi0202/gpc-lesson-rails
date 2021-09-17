class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      return
    end
    @new_post = Post.new
    @posts = Post.all
    render 'home/index'
  end

  def update
    @old_post = Post.find(params[:id])
    if @old_post.update(post_params)
      redirect_to post_path params[:id]
      return
    end
    @post = Post.find(params[:id])
    @new_post = Post.new
    @new_comment = Comment.new
    @favorites_count = @post.favorites.size
    render 'posts/show'
  end

  def show
    @new_post = Post.new
    @new_comment = Comment.new
    @post = Post.find(params[:id])
    @favorites_count = @post.favorites.size
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end

end
