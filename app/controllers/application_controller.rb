class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :menu_items_html
  before_filter :get_footer
  before_filter :get_header_numbers


  helper_method :current_user

  def current_user
    # abort @current_user.inspect
    @current_user ||= Admin::User.find(session[:user_id]) if session[:user_id]
  end

  def require_role
    redirect_to :back unless current_user.access?(params[:controller], params[:action])
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  # def require_editor
  #   redirect_to '/' unless current_user.editor?  # || current_user.admin?
  #   # ----------------- test data from controller to model -----------
  #   # redirect_to '/' unless current_user.editor?(params[:controller])
  # end
  #
  # def require_admin
  #   redirect_to :back unless current_user.admin?
  # end

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

    @menu_items.each do |m_a|
      if m_a.parent_id.to_s.to_i == 0
        @menu << "<li class='dropdown'><a class='dropdown-toggle' aria-expanded='false' aria-haspopup = 'true' data-toggle = 'dropdown' href = '#{m_a.link}' role = 'button' target= 'blank'> #{m_a.title} <span class='caret'></span></a>" if m_a.type_level == 'Заголовок меню'
        @menu << "<li > <a href = '#{m_a.link}' target='#{m_a.target}'> #{m_a.title} </span></a>" if m_a.type_level == 'Пункт меню'

        get_children m_a.id, m_a.type_level

        @menu << '</li>'
      end
    end
    @menu << '</ul>'
  end

  protected

    def get_children id, t_level
      # Inspect if m_item has children
      has_children = false
      @menu_items.each do |m_b|
        # @pfffp = true  if m_b.parent_id == id
        if m_b.parent_id == id
          has_children = true
        end
      end

      @menu << '<ul class="dropdown-menu">' if has_children == true && t_level == 'Заголовок меню'
      @menu << '<ul class="deep-level">' if has_children == true && t_level != 'Заголовок меню'
      iterator_separator = 0
      @menu_items.each do |m_b|
        if m_b.parent_id == id

          @menu << '<li class="divider", role = "separator"></li>' if iterator_separator > 0 && t_level == 'Заголовок меню'

          unless m_b.alias.blank? || params[:controller] != 'home' # != 'home' Need for upload image with CkEditor and not show this menu_items
              m_i_alias = url_for(['menu_item', m_b.alias])
              @menu << "<li><a href='#{m_i_alias}'> #{m_b.title}</a>" if t_level == 'Заголовок меню'
              @menu << "<li><a href='#{m_i_alias}'> #{m_b.title}</a>" if t_level != 'Заголовок меню'
          else
            @menu << "<li><a href='#{m_b.link}' target='#{m_b.target}'> #{m_b.title}</a>" if t_level == 'Заголовок меню'
            @menu << "<li><a href='#{m_b.link}' target='#{m_b.target}'> #{m_b.title}</a>" if t_level != 'Заголовок меню'
          end
          iterator_separator += 1

          get_children m_b.id, m_b.type_level

          @menu << '</li>'
        end
      end
      @menu << '</ul>' if has_children == true
    end

    def authorize
      # User.find_by(id: session[:user_id])
      # abort session[:user_id].inspect
      # abort admin_login_url.inspect
      if session[:user_id].nil? || !Admin::User.find_by(id: session[:user_id])
        # abort admin_login_url.inspect
        redirect_to admin_login_url, notice: "Please log in"
      end
    end
end
