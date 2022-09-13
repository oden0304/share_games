class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    #ViewのFormで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = current_user.comments.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
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
    params.require(:post).permit(:text, :post_image)
  end
end
