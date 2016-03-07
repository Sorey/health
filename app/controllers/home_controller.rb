class HomeController < ApplicationController

  def index
    # @news = Admin::News.find( { publish_on: true } ).sort( { created_at: -1 } ).limit(4) if @news
    @news_limit = Admin::News.where(publish_on: true).order(created_at: :desc).limit(4)
  end

  def all_news
    # @news = Admin::News.find( { publish_on: true } ).sort( { created_at: -1 } )
    @news = Admin::News.where(publish_on: true).order(created_at: :desc)
  end

  def show_one_news
    @news = Admin::News.find(params[:id])
  end

  def show_article
    @article = Article.find(params[:id])
  end

  def schedule

  end
end
