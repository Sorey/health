class MenuItemsController < ApplicationController
  before_action :authorize
  before_action :require_role
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
  layout 'application_admin'

  # GET /menu_items
  # GET /menu_items.json
  def index
    # @menu_items = MenuItem.where(show: true, type_item: "Бокове меню").order(order_item: :asc)
    @menu_items = MenuItem.order( type_item: "asc")
    @menu = ''
    @menu_items.each do |m_i|
      if m_i.parent_id.to_s.to_i == 0
        @menu << '<tr>'
        @menu << "<td> #{m_i.id.to_s.last(8)}</td>"
        # @menu << "<td> #{m_i.type_level} </td> <td> #{m_i.type_item} </td>
        @menu << "<td> #{m_i.title} </td> <td> #{m_i.link.blank? ? '-' : '+'} </td> <td> #{m_i.alias} </td><td> #{m_i.parent_id} </td> <td> #{m_i.order_item} </td>"
        @menu << "<td><a href='/admin/menu_items/#{m_i.id}'>Show</a> </td> <td><a href='/admin/menu_items/#{m_i.id}/edit'>Edit</a></td> <td><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/admin/menu_items/#{m_i.id}'>Destroy</a></td> "
        @menu << '</tr>'

        get_children_m m_i.id
      end
    end
  end



  def get_level level
    result = case level
      when 'Перший рівень' then "-"
      when 'Додатковий рівень' then "- -"
      else ""
    end
    result
  end

  # GET /menu_items/1
  # GET /menu_items/1.json
  def show
  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
  end

  # GET /menu_items/1/edit
  def edit
  end

  # POST /menu_items
  # POST /menu_items.json
  def create
    @menu_item = MenuItem.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully created.' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1
  # PATCH/PUT /menu_items/1.json
  def update
    # abort @menu_item.id_post.inspect
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_items_url, notice: 'Menu item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

    def get_children_m parent_id
      @menu_items.each do |m_i|
        if m_i.parent_id == parent_id
          get_level = get_level m_i.type_level
          # get_link = get_link m_i.link

          @menu << '<tr>'
          @menu << "<td> #{m_i.id.to_s.last(8)}</td>"
          # @menu << "<td>#{get_level} #{m_i.type_level} </td> <td> #{m_i.type_item} </td>
          @menu << "<td>#{get_level} #{m_i.title} </td> <td class='td_link'> #{m_i.link.blank? ? '-' : '+'} </td> <td> #{m_i.alias} </td><td> #{m_i.parent_id.to_s.last(8)} </td> <td> #{m_i.order_item} </td>"
          @menu << "<td><a href='/admin/menu_items/#{m_i.id}'>Show</a> </td> <td><a href='/admin/menu_items/#{m_i.id}/edit'>Edit</a></td> <td><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/admin/menu_items/#{m_i.id}'>Destroy</a></td> "
          @menu << '</tr>'

          get_children_m m_i.id
        end
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:type_item, :title, :parent_id, :type_level, :show, :order_item, :link, :alias, :id_post)
    end
end
