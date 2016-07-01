class NewsController < ApplicationController

#---------------------- News ------------------------#
  def all_news
    @news = Admin::News.where(publish_on: true).order(created_at: :desc).page(params[:page]).per(20)
    set_title_page "Новини Департаменту охорони здоров'я"
  end

  def show_one_news
    @news = Admin::News.find(params[:id])
    set_title_page @news.title
  end

#------------------ Managers news -------------------#
  def all_managers_news
    @all_managers_news = Admin::ManagersNews.where(publish_on: true).order(date_start: :desc).page(params[:page]).per(20)
  end

  def show_one_managers_news
    @managers_news = Admin::ManagersNews.find(params[:id])
  end
end