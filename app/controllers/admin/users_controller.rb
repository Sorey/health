module Admin
  class UsersController < AdminController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = Admin::User.all
    end

    def show
    end

    def new
      @user = Admin::User.new
    end

    def edit
    end

    def create
      @user = Admin::User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
        params[:admin_user].delete(:password)
        params[:admin_user].delete(:password_confirmation)
      end

      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path
    end

    private

      def set_user
        @user = Admin::User.find(params[:id])
      end

      def user_params
        params.require(:admin_user).permit(:name, :full_name, :email, :password, :password_confirmation, admin_role_ids: [])
      end
  end
end
