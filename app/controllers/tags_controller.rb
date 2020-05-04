class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    flash.notice = "Tag #{@tag.name} has been deleted"
    redirect_to tags_path
  end
end
