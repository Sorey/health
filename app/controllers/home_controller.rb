class HomeController < ApplicationController

  def index
    # @news = Admin::News.find( { publish_on: true } ).sort( { created_at: -1 } ).limit(4) if @news
    @news_limit = Admin::News.where(publish_on: true).order(created_at: :desc).limit(4)

    @right_menu_items = MenuItem.where(show: true, type_item: "Головне меню").order(order_item: :asc)

    # def get_right_children id, t_level
    #   # Inspect if m_item has children
    #   has_children = false
    #   @right_menu_items.each do |m_b|
    #     # @pfffp = true  if m_b.parent_id == id
    #     if m_b.parent_id == id
    #       has_children = true
    #     end
    #   end
    #
    #   @menu << "<div class='panel-collapse collapse' id='collapseTwo'>" if has_children == true && t_level == 'Заголовок меню'
    #   # @menu << '<ul class="deep-level">' if has_children == true && t_level != 'Заголовок меню'
    #   iterator_separator = 0
    #   @menu_items.each do |m_b|
    #     if m_b.parent_id == id
    #       @menu << "<div class='items'><a href='#'><div class='item'><div class='text'>"
    #       @menu << '<li class="divider", role = "separator"></li>' if iterator_separator > 0 && t_level == 'Заголовок меню'
    #
    #       unless m_b.alias.blank?
    #         if  params[:controller] == 'home' # Need for upload image with CkEditor
    #           m_i_alias = url_for(['menu_item', m_b.alias])
    #           @menu << "<li><a href='#{m_i_alias}'> #{m_b.title}</a>" if t_level == 'Заголовок меню'
    #           # @menu << "<li><a href='#{m_i_alias}'> #{m_b.title}</a>" if t_level != 'Заголовок меню'
    #         end
    #       else
    #         @menu << "<li><a href='#{m_b.link}'> #{m_b.title}</a>" if t_level == 'Заголовок меню'
    #         # @menu << "<li ><a href='#{m_b.link}'> #{m_b.title}</a>" if t_level != 'Заголовок меню'
    #       end
    #       iterator_separator += 1
    #
    #       get_children m_b.id, m_b.type_level
    #
    #       @menu << '</li>'
    #     end
    #   end
    #   @menu << '</div>' if has_children == true
    # end

    @right_menu = ""
    @right_menu_items.each do |m_a|
      if m_a.parent_id == 0
        @right_menu << "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title dd'> " # if m_a.type_level == 'Заголовок меню'
        @right_menu << "<a data-parent='#accordion' data-toggle='collapse' href='##{m_a.id.to_s.last(8)}'><div class='item'><div class='text'>#{m_a.title}</div>
<i class='fa fa-chevron-left'></i><i class='fa fa-chevron-down'></i></div></a></h4></div>" if m_a.type_level == 'Заголовок меню'
        @right_menu << "<a data-parent='#accordion' data-toggle='collapse' href='##{m_a.id.to_s.last(8)}'><div class='item'><div class='text'>#{m_a.title}</div>
<i class='fa fa-chevron-left'></i></div></a></h4></div>" if m_a.type_level == 'Пункт меню'
        @right_menu << "" #if m_a.type_level == 'Пункт меню'

        # get_right_children m_a.id, m_a.type_level

        @right_menu << '</div>'
      end
    end
  #   @right_menu << '</ul>'
  #
  #   <div class='panel panel-default'>
  #   <div class='panel-heading'>
  #   <h4 class='panel-title dd'>
  #   <a data-parent='#accordion' data-toggle='collapse' href='#collapseTwo'>
  #   <div class='item'>
  #   <div class='text'>
  #       Впровадження сучасних методик та технологій
  #   </div>
  #         <i class='fa fa-chevron-left'></i>
  #   <i class='fa fa-chevron-down'></i>
  #       </div>
  #   </a>
  #   </h4>
  #   </div>
  # # <div class='panel-collapse collapse' id='collapseTwo'>
  # #   <div class='items'>
  # #     <a href='#'>
  # #       <div class='item'>
  # #         <div class='text'>
  # #           Реєстр методичних рекомендацій, інформаційних листів (ІАЦМС)
  # #         </div>
  #   <i class='fa fa-chevron-left'></i>
  #       </div>
  #   </a>
  #   </div>
  #   <div class='items'>
  #   <a href='http://www.amnu.gov.ua/index.php?p=articles&amp;action=displayarticle&amp;id=83' target='_blank'>
  #   <div class='item'>
  #   <div class='text'>
  #       Інформаційний бюлетень
  #   </div>
  #         <i class='fa fa-chevron-left'></i>
  #   </div>
  #     </a>
  #   </div>
  # </div>
  #   </div>
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
