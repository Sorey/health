module Admin
  class MenuItemsController < AdminController
    skip_before_action :require_role, only: [:index, :show, :edit, :update]
    before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

    def index
      params[:category] = params[:category] || "Головне меню"
      # @menu_items = MenuItem.where(type_item: params[:category]).order(order_item: :asc) unless params[:category].blank?
      @menu_items = MenuItem.get_menu_items(params[:category], current_user.admin_roles.first)
      @menu_category = params[:category] unless params[:category].blank?
      @menu = ''
      @menu_items.each do |m_i|
        if m_i.parent_id.to_s.to_i == 0
          @menu << '<tr>'
          @menu << "<td> #{m_i.id.to_s.last(8)}</td>"
          @menu << "<td> #{m_i.title} </td> <td> #{m_i.show == true ? '+' : '-'} </td> <td class='td_link'> #{m_i.target} </td><td> #{m_i.alias} </td><td> #{m_i.parent_id} </td> <td> #{m_i.order_item} </td><td>"
          @menu << "<a href='/admin/menu_items/#{m_i.id}' class='btn btn-info'><i class='fa fa-eye'></i></a> <a href='/admin/menu_items/#{m_i.id}/edit' class='btn btn-primary' ><i class='fa fa-pencil-square-o'></i></a>"
          @menu << "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/admin/menu_items/#{m_i.id}' class='btn btn-danger'><i class='fa fa-trash-o'></i></a> " if current_user.access?(params[:controller], params[:action])
          @menu << '</td></tr>'

          get_children_m m_i.id
        end
      end
      respond_to do |format|
        format.js
        format.html
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

    def show
    end

    def new
      @menu_item = Admin::MenuItem.new
    end

    def edit
    end

    def create
      @menu_item = Admin::MenuItem.new(menu_item_params)

      respond_to do |format|
        if @menu_item.save
          author = [author: current_user.full_name, author_role: current_user.admin_roles.first.title, date: Time.now]
          @menu_item.list_authors = author
          @menu_item.save
          format.html { redirect_to @menu_item, notice: 'Menu item was successfully created.' }
          format.json { render :show, status: :created, location: @menu_item }
        else
          format.html { render :new }
          format.json { render json: @menu_item.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @menu_item.update(menu_item_params)
          if @menu_item.list_authors.nil?
            author = [author: current_user.full_name, author_role: current_user.admin_roles.first.title, date: Time.now]
            @menu_item.list_authors = author
          else
            author = {author: current_user.full_name, author_role: current_user.admin_roles.first.title, date: Time.now}
            @menu_item.list_authors << author
          end
          @menu_item.save
          format.html { redirect_to @menu_item, notice: 'Menu item was successfully updated.' }
          format.json { render :show, status: :ok, location: @menu_item }
        else
          format.html { render :edit }
          format.json { render json: @menu_item.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @menu_item.destroy
      respond_to do |format|
        format.html { redirect_to admin_menu_items_url, notice: 'Menu item was successfully destroyed.' }
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
            @menu << "<td>#{get_level} #{m_i.title} </td> <td class='td_link'> #{m_i.show == true ? '+' : '-'} </td> <td class='td_link'> #{m_i.target} </td> <td> #{m_i.alias} </td><td> #{m_i.parent_id.to_s.last(8)} </td> <td> #{m_i.order_item} </td><td>"
            @menu << "<a href='/admin/menu_items/#{m_i.id}' class='btn btn-info'><i class='fa fa-eye'></i></a> <a href='/admin/menu_items/#{m_i.id}/edit' class='btn btn-primary' ><i class='fa fa-pencil-square-o'></i></a"
            @menu << "><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/admin/menu_items/#{m_i.id}' class='btn btn-danger'><i class='fa fa-trash-o'></i></a>" if current_user.access?(params[:controller], params[:action])
            @menu << '</td></tr>'

            get_children_m m_i.id
          end
        end
      end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_menu_item
        @menu_item = Admin::MenuItem.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def menu_item_params
        params.require(:admin_menu_item).permit(:type_item, :title, :parent_id, :type_level, :show, :order_item, :link, :target, :alias, :id_post, :admin_role_id)
      end
  end
end