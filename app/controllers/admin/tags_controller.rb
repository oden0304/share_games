class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  def destroy
  end
  
  def tag_params
    params.require(:tag).permit(:tag)
  end
end
