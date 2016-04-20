class NewsController < ApplicationController
#---------------------- News ------------------------#
  def all_news
    @news = Admin::News.where( { publish_on: true } ).sort( { created_at: 1 } )
    # @news = Admin::News.where(publish_on: true).order(created_at: :desc)
  end

  def show_one_news
    @news = Admin::News.find(params[:id])

    meta_data @news
  end

#------------------ Managers news -------------------#
  def all_managers_news
    @all_managers_news = Admin::ManagersNews.where(publish_on: true).order(date_start: :desc)
  end

  def show_one_managers_news
    @managers_news = Admin::ManagersNews.find(params[:id])
  end
end