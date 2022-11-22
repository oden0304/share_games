class Public::UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).includes(:user).order(created_at: :desc)
    favorites = Favorite.where(user_id: @user.id).order(created_at: :desc).pluck(:post_id) # いいねしたユーザーのIDを取得し、pluckメソッドで投稿IDを取得する
    @favorite_posts = Post.find(favorites)
    # DM機能
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
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

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    return if @user == current_user

    redirect_to public_user_path(current_user)
  end
end
