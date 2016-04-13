class NewsController < ApplicationController
#---------------------- News ------------------------#


#------------------ Managers news -------------------#
  def all_managers_news
    @all_managers_news = Admin::ManagersNews.where(publish_on: true).order(date_start: :desc)
  end

  def show_one_managers_news
    @managers_news = Admin::ManagersNews.find(params[:id])
  end
end