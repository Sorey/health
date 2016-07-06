class HomeController < ApplicationController
  before_filter :get_right_menu
  before_filter :get_polls
  before_filter :get_three_videos

  def index
    @news_limit = Admin::News.get_last_news(4)
  end

  def get_right_menu
    @right_menu_items = Admin::MenuItem.get_menu 'Бокове меню'

    @right_menu = ""
    @right_menu_items.each do |right_menu_item|
      if right_menu_item.parent_id.to_s.to_i == 0
        @right_menu << "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title dd'>"
        @right_menu << "<a data-parent='#accordion' data-toggle='collapse' href='##{right_menu_item.id.to_s.last(8)}'>
        <div class='item'><div class='text'>#{right_menu_item.title}</div><i class='fa fa-chevron-left'></i>
        <i class='fa fa-chevron-down'></i></div></a></h4></div>" if right_menu_item.type_level == 'Заголовок меню'
        @right_menu << "<a href='#{right_menu_item.link}' target='#{right_menu_item.target}'>
        <div class='item'><div class='text'>#{right_menu_item.title}</div>
        <i class='fa fa-chevron-left'></i></div></a></h4></div>" if right_menu_item.type_level == 'Пункт меню'

        get_right_children right_menu_item.id if right_menu_item.children.any?

        @right_menu << "</div>"
      end
    end
  end

  def get_three_videos
    @three_videos = Admin::Video.where(publish_on: true).order(created_at: :desc).limit(3)
  end

  def get_polls
    @polls = Admin::Poll.where(publish_on: true).order(order_question: :asc)
  end

  def sitemap
    @alias_articles = Admin::MenuItem.get_alias_links
    @articles = Admin::Article.where(publish_on: true)
    @videos = Admin::Video.where(publish_on: true)
    @news = Admin::News.where(publish_on: true)

    @articles_group = Admin::ArticlesGroup.where(title_english: 'regional_programs').first
    @group_articles = Admin::Article.where(:admin_articles_group_id => @articles_group.id) if @articles_group

    @medical_setups_groups = Admin::MedicalSetupsGroup.all

    respond_to do |format|
      format.xml
    end
  end

  protected

  def get_right_children id
    @right_menu << "<div class='panel-collapse collapse' id='#{id.to_s.last(8)}'>" # if children_has? id
    @right_menu_items.each do |right_menu_item|
      if right_menu_item.parent_id == id
        unless right_menu_item.alias.blank? # Get alias or link
          m_i_alias = url_for(['menu_item', right_menu_item.alias])
          @right_menu << "<div class='items'><a href='#{m_i_alias}'><div class='item'><div class='text'>#{right_menu_item.title}
          </div><i class='fa fa-chevron-left'></i></div></a></div>" if !right_menu_item.children.any?
        else
          @right_menu << "<div class='items'><a href='#{right_menu_item.link}' target='#{right_menu_item.target}'><div class='item'><div class='text'>#{right_menu_item.title}
          </div><i class='fa fa-chevron-left'></i></div></a></div>" if !right_menu_item.children.any?
        end
        @right_menu << "<div class='items' id='accordion2'><div class='panel panel-default'><div class='panel-heading'>
        <h4 class='panel-title dd'><a data-parent='#accordion2' data-toggle='collapse' href='##{right_menu_item.id.to_s.last(8)}'>
        <div class='item'><div class='text'>#{right_menu_item.title}</div><i class='fa fa-chevron-left'></i><i class='fa fa-chevron-down'>
        </i></div></a></h4></div>" if right_menu_item.children.any?

        get_right_children right_menu_item.id

        @right_menu << "</div></div>" if right_menu_item.children.any?
      end
    end
    @right_menu << "</div>" # if children_has? id
  end

end
