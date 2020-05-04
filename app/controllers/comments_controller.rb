class CommentsController < ApplicationController
  include CommentsHelper

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render 'new'
    end
  end
end
