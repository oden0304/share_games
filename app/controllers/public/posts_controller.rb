class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    
    #ViewのFormで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search], params[:type])
    @tags = Tag.all
    @posts = params[:name].present? ? Tag.find(params[:name]).posts : Post.all.order(created_at: :desc)
  end
  
  def follow_index
    @feeds = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
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
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_user_path(@post.user)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:text, :post_image, tag_ids: [])
  end
end
