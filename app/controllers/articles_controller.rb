class ArticlesController < ApplicationController

  def show_articles_group
    @articles_group = Admin::ArticlesGroup.find_by(title_english: params[:title_group])
    @articles = Admin::Article.where(:admin_articles_group_id => @articles_group.id)
  end

  def show_article
    @article = Admin::Article.find_by(title_english: params[:title_article])
  end
end