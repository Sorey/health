module Admin
  class RolesController < AdminController
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
      @roles = Admin::Role.all.order(created_at: :asc)
    end

    def show
    end

    def new
      @role = Admin::Role.new
    end

    def edit
      redirect_to :back if @role.title.eql?("admin")
    end

    def create
      @role = Admin::Role.new(role_params)

      respond_to do |format|
        if @role.save
          format.html { redirect_to @role, notice: 'Role was successfully created.' }
          format.json { render action: 'show', status: :created, location: @role }
        else
          format.html { render action: 'new' }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @role.update(role_params)
          format.html { redirect_to @role, notice: 'Role was successfully created.' }
          format.json { render action: 'show', status: :created, location: @role }
        else
          format.html { render action: 'edit' }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @role.destroy unless @role.title.eql?("admin")

      respond_to do |format|
        format.html { redirect_to admin_roles_url, notice: 'Role was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private

      def set_role
        @role = Admin::Role.find(params[:id])
      end

      def role_params
        params.require(:admin_role).permit(:title, :type_role, :parent_id)
      end
  end
end
