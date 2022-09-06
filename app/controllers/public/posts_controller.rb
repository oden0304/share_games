class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to public_post_path(@post.id)
    else
      render :new
    end
  end
  
  def update
  end
  
  private
  
  def post_params
    params.require(:post).permit(:text)
  end
end
