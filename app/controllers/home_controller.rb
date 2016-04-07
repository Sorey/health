class HomeController < ApplicationController
  before_filter :get_right_menu
  before_filter :get_questions

  def index
    # @news = Admin::News.find( { publish_on: true } ).sort( { created_at: -1 } ).limit(4) if @news
    @news_limit = Admin::News.where(publish_on: true).order(created_at: :desc).limit(4)
  end

  def get_right_menu
    @right_menu_items = Admin::MenuItem.where(show: true, type_item: "Бокове меню").order(order_item: :asc)

    @right_menu = ""
    @right_menu_items.each do |m_a|
      if m_a.parent_id.to_s.to_i == 0
        @right_menu << "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title dd'>"
        @right_menu << "<a data-parent='#accordion' data-toggle='collapse' href='##{m_a.id.to_s.last(8)}'>
        <div class='item'><div class='text'>#{m_a.title}</div><i class='fa fa-chevron-left'></i>
        <i class='fa fa-chevron-down'></i></div></a></h4></div>" if m_a.type_level == 'Заголовок меню'
        @right_menu << "<a href='#{m_a.link}'>
        <div class='item'><div class='text'>#{m_a.title}</div>
        <i class='fa fa-chevron-left'></i></div></a></h4></div>" if m_a.type_level == 'Пункт меню'

        get_right_children m_a.id

        @right_menu << "</div>"
      end
    end
  end

  def get_questions
    @polls = Admin::Poll.all
  end

  def all_news
    # @news = Admin::News.find( { publish_on: true } ).sort( { created_at: -1 } )
    @news = Admin::News.where(publish_on: true).order(created_at: :desc)
  end

  def show_one_news
    @news = Admin::News.find(params[:id])
  end

  def show_article
    @article = Admin::Article.find(params[:id])
  end

  def schedule
    #Static page
  end

  protected

  # Inspect if m_item has children
  def children_has? id_p
    has_children = false
    @right_menu_items.each do |m_b|
      if m_b.parent_id == id_p
        has_children = true
      end
    end
    has_children
  end

  def get_right_children id
    @right_menu << "<div class='panel-collapse collapse' id='#{id.to_s.last(8)}'>" if children_has? id

    @right_menu_items.each do |m_b|
      if m_b.parent_id == id

        unless m_b.alias.blank? # Get alias or link
          # if  params[:controller] == 'home' # Need for upload image with CkEditor
          m_i_alias = url_for(['menu_item', m_b.alias])
          @right_menu << "<div class='items'><a href='#{m_i_alias}'><div class='item'><div class='text'>#{m_b.title}
          </div><i class='fa fa-chevron-left'></i></div></a></div>" if !children_has? m_b.id
        else
          @right_menu << "<div class='items'><a href='#{m_b.link}'><div class='item'><div class='text'>#{m_b.title}
          </div><i class='fa fa-chevron-left'></i></div></a></div>" if !children_has? m_b.id
        end
        # abort "fsf"
        @right_menu << "<div class='items' id='accordion2'><div class='panel panel-default'><div class='panel-heading'>
        <h4 class='panel-title dd'><a data-parent='#accordion2' data-toggle='collapse' href='##{m_b.id.to_s.last(8)}'>
        <div class='item'><div class='text'>#{m_b.title}</div><i class='fa fa-chevron-left'></i><i class='fa fa-chevron-down'>
        </i></div></a></h4></div>" if children_has? m_b.id

        get_right_children m_b.id #, m_b.type_level

        @right_menu << "</div></div>" if children_has? m_b.id

      end
    end
    @right_menu << "</div>" if children_has? id
  end

end
