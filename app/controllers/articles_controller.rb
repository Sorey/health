class ArticlesController < ApplicationController

# Group articles for menu_item
  def show_article
    @article = Admin::Article.find(params[:id])
    meta_data @article
  end

  def show_articles_group
    @articles_group = Admin::ArticlesGroup.find_by(title_english: params[:title_group])
    set_title_page @articles_group.title
    @articles = Admin::Article.where(publish_on: true, :admin_articles_group_id => @articles_group.id).page(params[:page]).per(30)
  end

# Single article for menu_item
  def show_groups_article
    @article = Admin::Article.find_by(title_english: params[:title_article])
    meta_data @article
  end
end