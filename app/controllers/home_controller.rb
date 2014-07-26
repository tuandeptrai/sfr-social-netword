class HomeController < ApplicationController
  before_filter :authenticate_user
  def index
    @user = current_user
  end

  def all_article
    @articles = Article.all.limit(10)
  end

end