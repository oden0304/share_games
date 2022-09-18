class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :correct_user,only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).includes(:user).order(created_at: :desc)
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_user_path(@post)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to public_user_path(current_user)
    end
  end  
  
  def correct_user
        @user = User.find(params[:id])
    unless @user == current_user
      redirect_to public_user_path(current_user)
    end
  end

end
