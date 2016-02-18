class HomeController < ApplicationController
  def index
    @news_limit = Admin::News.where(publish_on: true).order(created_at: :desc).first(4)
  end

  def all_news
    @news = Admin::News.where(publish_on: true).order(created_at: :desc)
  end

  def show_one_news
    @news = Admin::News.find(params[:id])
  end

end
