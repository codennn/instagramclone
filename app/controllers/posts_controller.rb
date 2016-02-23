class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def permit_post
    params.require(:post).permit(:image,:description,:Title)
  end
end
