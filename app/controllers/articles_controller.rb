class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article #{@article.title} has been created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)

      flash.notice = "Article #{@article.title} updated!"

      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    flash.notice = "Article #{@article.title} has been deleted!"
    redirect_to articles_path
  end
end
