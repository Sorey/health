module Admin
  class RolesController < AdminController
    def index
      @roles = Admin::Role.all.order(created_at: :asc)
    end

    def show
      @role = Admin::Role.find(params[:id])
    end

    def new
      @role = Admin::Role.new
    end

    def edit
      @role = Role.find(params[:id])
      redirect_to :back if @role.title.eql?("admin")
    end

    def create
      @role = Admin::Role.new(role_params)

      respond_to do |format|
        if @role.save
          # if :require_admin
          format.html { redirect_to @role, notice: 'Role was successfully created.' }
          format.json { render action: 'show', status: :created, location: @role }
          # else
          #   session[:user_id] = @user.id
          #   format.html { render action: 'users1', notice: 'User was successfully created!!!' }
          #   format.json { render action: '/', status: :created, location: @user }
          # end
        else
          format.html { render action: 'new' }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @role = Admin::Role.find(params[:id])

      respond_to do |format|
        if @role.update(role_params)
          format.html { redirect_to @role, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @role }
        else
          format.html { render action: 'edit' }
          format.json { render json: @role.errors, status: :unprocessable_entity }

        end
      end
    end

    def destroy
      @role = Admin::Role.find(params[:id])
      redirect_to :back if @role.title.eql?("admin")
      @role.destroy

      redirect_to admin_roles_path
    end

    private

    def role_params
      params.require(:admin_role).permit(:title, :type_role, :parent_id)
    end
  end
end
