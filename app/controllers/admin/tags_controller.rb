class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      @tags = Tag.all
      render :index
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
