class HomeController < ApplicationController
  # $MENU
  def index
    @news_limit = Admin::News.where(publish_on: true).order(created_at: :desc).first(4)

    @menu_items = MenuItem.all
    # render :text => @menu_items.inspect
    # $MENU = "<ul>"
    @menu_items.each do |m_i|
      i = "0"
      # $MENU << "<li> #{m_i.title} " if m_i.parent_id == i

      @s1s = m_i if m_i.type_way == i
      # raise @s1s.inspect
      @g_m_i = []

      # @g_m_i[@s1s.title] << get_child(@s1s.id)
      # get_child (@s1s.id)

      @menu_items.each  do |m_i_i|
        @s1s1s = m_i_i if m_i_i.parent_id == @s1s.id
        @g_m_i = []
        @g_m_i[:parent => @s1s.title.to_s] << { :id => m_i_i.id.to_i, :title => m_i_i.title.to_s }
      end

      # def get_child(mi_id)
      #   @menu_items.each  do |m_i_i|
      #
      #     @s1s1s = m_i_i if m_i_i.parent_id == mi_id
      #     m_i_i.title
      #     # @g_m_i_2 = []
      #     # @g_m_i_2[@s1s1s.title] << get_child (@s1s1s.id)
      #     # @g_m_i[mi_title] << @s1s1s.title
      #
      #     # get_child @s1s1s.id, @s1s1s.title
      #   end
      # end

    end
    @g_m_i
    # abort @menu_items.inspect
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
