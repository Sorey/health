class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :menu_items_html
  before_filter :get_footer
  before_filter :get_header_numbers

  def get_footer
    @footer_contacts = Admin::Article.where(title: "Футер - На зв'язку").first
    @news_footer = Admin::News.where(publish_on: true).order(created_at: :desc).limit(2)
    @footer_navigation = Admin::Article.where(title: "Footer-navigation").first
  end

  def get_header_numbers
    @header_numbers = Admin::Article.where(title: "Header-numbeers").first
  end

  def menu_items_html
    @menu_items = Admin::MenuItem.where(show: true, type_item: "Головне меню").order(order_item: :asc)
    @menu = '<ul class="nav navbar-nav">'
    @menu_items.each do |menu_item|
      if menu_item.parent_id.to_s.to_i == 0
        @menu << "<li class='dropdown'><a class='dropdown-toggle' aria-expanded='false' aria-haspopup = 'true' data-toggle = 'dropdown' href = '#{menu_item.link}' role = 'button' target= 'blank'> #{menu_item.title} <span class='caret'></span></a>" if menu_item.type_level == 'Заголовок меню'
        @menu << "<li > <a href = '#{menu_item.link}' target='#{menu_item.target}'> #{menu_item.title} </span></a>" if menu_item.type_level == 'Пункт меню'
        # get_children menu_item.id, menu_item.type_level if menu_item.children.any?
        get_children menu_item, menu_item.type_level if menu_item.children.any?
        @menu << '</li>'
      end
    end
    @menu << '</ul>'
  end

  protected

    def set_title_page title
      @title_page = title
    end

    def meta_data page
      @title_page = page.title unless page.title.blank?
      @meta_keywords = page.meta_keywords unless page.meta_keywords.blank?
      @meta_description = page.meta_description unless page.meta_keywords.blank?
    end
    # .sort_by(&:order_answer)
    def get_children r_menu_item, t_level
      @menu << '<ul class="dropdown-menu">' if t_level == 'Заголовок меню'
      @menu << '<ul class="deep-level">' if t_level != 'Заголовок меню'
      iterator_separator = 0
      r_menu_item.children.where(show: true).sort_by(&:order_item).each do |menu_item|
        @menu << '<li class="divider", role = "separator"></li>' if iterator_separator > 0 && t_level == 'Заголовок меню'
        unless menu_item.alias.blank? || params[:controller] == 'ckeditor/pictures' # != 'home' Need for upload image with CkEditor and not show this menu_items
          m_i_alias = url_for(['menu_item', menu_item.alias])
          @menu << "<li><a href='#{m_i_alias}'> #{menu_item.title}</a>" if t_level == 'Заголовок меню'
          @menu << "<li><a href='#{m_i_alias}'> #{menu_item.title}</a>" if t_level != 'Заголовок меню'
        else
          @menu << "<li><a href='#{menu_item.link}' target='#{menu_item.target}'> #{menu_item.title}</a>" if t_level == 'Заголовок меню'
          @menu << "<li><a href='#{menu_item.link}' target='#{menu_item.target}'> #{menu_item.title}</a>" if t_level != 'Заголовок меню'
        end
        iterator_separator += 1
        get_children menu_item, menu_item.type_level if menu_item.children.any?
        @menu << '</li>'
      end
      @menu << '</ul>'
    end

    def get_children1 id, t_level
      @menu << '<ul class="dropdown-menu">' if t_level == 'Заголовок меню'
      @menu << '<ul class="deep-level">' if t_level != 'Заголовок меню'
      iterator_separator = 0
      @menu_items.each do |menu_item|
        if menu_item.parent_id == id
          @menu << '<li class="divider", role = "separator"></li>' if iterator_separator > 0 && t_level == 'Заголовок меню'
          unless menu_item.alias.blank? || params[:controller] == 'ckeditor/pictures' # != 'home' Need for upload image with CkEditor and not show this menu_items
            m_i_alias = url_for(['menu_item', menu_item.alias])
            @menu << "<li><a href='#{m_i_alias}'> #{menu_item.title}</a>" if t_level == 'Заголовок меню'
            @menu << "<li><a href='#{m_i_alias}'> #{menu_item.title}</a>" if t_level != 'Заголовок меню'
          else
            @menu << "<li><a href='#{menu_item.link}' target='#{menu_item.target}'> #{menu_item.title}</a>" if t_level == 'Заголовок меню'
            @menu << "<li><a href='#{menu_item.link}' target='#{menu_item.target}'> #{menu_item.title}</a>" if t_level != 'Заголовок меню'
          end
          iterator_separator += 1
          get_children menu_item.id, menu_item.type_level if menu_item.children.any?
          @menu << '</li>'
        end
      end
      @menu << '</ul>'
    end
end
