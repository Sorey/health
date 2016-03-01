class HomeController < ApplicationController
  # $MENU
  def get_children id, t_way

    @menu_items.each do |m_a|
      @pfffp = true  if m_a.parent_id == id
    end

    @menu << '<ul class="dropdown-menu">' if @pfffp == true && t_way == "0"
    @menu << '<ul class="level-3">' if @pfffp == true && t_way.to_i > 0
    iterator = 0
    @menu_items.each do |m_a|
      if m_a.parent_id == id

        @menu << '<li class="divider", role = "separator"></li>' if iterator > 0 && t_way == "0"
        @menu << "<li><a> #{m_a.title}</a>" if t_way.to_i == 0
        @menu << "<li style='list-style: none; margin-left: -30px'><a style='color: #5390C5'> #{m_a.title}</a>" if t_way.to_i > 0
        # @menu << "<li><a> #{m_a.title}</a>"  if t_way > 1
        iterator += 1
        get_children m_a.id, m_a.type_level
        @menu << '</li>'
      end
    end
    @menu << '</ul>' if @pfffp == true
  end

  def index
    @news_limit = Admin::News.where(publish_on: true).order(created_at: :desc).first(4)

    @menu_items = MenuItem.all
    @g_m_i = []
    @menu = '<ul class="nav navbar-nav">'

    @menu_items.each do |m_a|
      if m_a.parent_id == nil
        @menu << "<li class='dropdown'><a class='dropdown-toggle' aria-expanded='false' aria-haspopup = 'true' data-toggle = 'dropdown' href = '#' role = 'button' target= 'blank'> #{m_a.title} <span class='caret'></span></a>"
        get_children m_a.id, m_a.type_level
        @menu << '</li>'
      end
    end

    @menu << '</ul>'

    # abort @menu.inspect
    # abort @menu_items.inspect
    # render :text => @menu_items.inspect
    # $MENU = "<ul>"

    test  = 0
    # @menu_items.each do |m_i|
    #   i = nil
    #   # $MENU << "<li> #{m_i.title} " if m_i.parent_id == i
    #   # abort m_i.type_way.inspect if test == 2
    #   @s1s = m_i if m_i.parent_id.nil?
    #   # raise @s1s.inspect
    #   # test += 1
    #   @g_m_i << @s1s
    #
    #   # @g_m_i[@s1s.title] << get_child(@s1s.id)
    #   # get_child (@s1s.id)
    #
    #   # @menu_items.each  do |m_i_i|
    #   #   @s1s1s = m_i_i if m_i_i.parent_id == @s1s.id
    #   #   @g_m_i = []
    #   #   @g_m_i[:parent => @s1s.title.to_s] << { :id => m_i_i.id.to_i, :title => m_i_i.title.to_s }
    #   # end
    #
    #   # def get_child(mi_id)
    #   #   @menu_items.each  do |m_i_i|
    #   #
    #   #     @s1s1s = m_i_i if m_i_i.parent_id == mi_id
    #   #     m_i_i.title
    #   #     # @g_m_i_2 = []
    #   #     # @g_m_i_2[@s1s1s.title] << get_child (@s1s1s.id)
    #   #     # @g_m_i[mi_title] << @s1s1s.title
    #   #
    #   #     # get_child @s1s1s.id, @s1s1s.title
    #   #   end
    #   # end
    #
    # end
    # @g_m_i
    # abort @g_m_i.inspect
    # abort $MENU.inspect
  end

  def all_news
    @news = Admin::News.where(publish_on: true).order(created_at: :desc)
  end

  def show_one_news
    @news = Admin::News.find(params[:id])
  end

  def structure

  end

  def schedule

  end
end
