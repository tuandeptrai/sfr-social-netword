class ArticlesController < ApplicationController
  before_filter :authenticate_user

  def new
  end

  def create
    @article = Article.new
    @article.user_id = current_user.id
    @article.title = params[:title]
    @article.content = params[:content]
    @article.created_at = Time.now
    if @article.title != nil && @article.content != nil
      @article.save
      redirect_to index_path
      flash[:notice] = 'Create successfully!'
    else
      redirect_to index_path
      flash[:notice] = 'Content valid!'
    end
  end

  def update
  end
  def delete
  end

  def post_comment
    @cm = Comment.new
    @cm.article_id = params[:article_id]
    @cm.user_id = current_user.id
    @cm.content = params[:content_art]

    if @cm.content != nil
      @cm.save
      redirect_to index_path
      flash[:notice] = 'Create successfully!'
    else
      redirect_to index_path
      flash[:notice] = 'Content valid!'
    end
  end

  private

end