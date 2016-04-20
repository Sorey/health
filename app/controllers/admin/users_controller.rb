module Admin
  class UsersController < AdminController
    def index
      # /////abort User.all.inspect
      #
      @users = Admin::User.all
    end

    def show
      @user = Admin::User.find(params[:id])
    end

    def new
      @user = Admin::User.new
      # abort params.inspect
    end

    def edit
      @user = Admin::User.find(params[:id])
    end

    def create
      @user = Admin::User.new(user_params)

      respond_to do |format|
        if @user.save
          # MessageMailer.new_message(@user).deliver
          # if :require_admin
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
          # else
          #   session[:user_id] = @user.id
          #   format.html { render action: 'users1', notice: 'User was successfully created!!!' }
          #   format.json { render action: '/', status: :created, location: @user }
          # end
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
      # if @user.save
      #   #session[:user_id] = @user.id
      #   redirect_to @user #'/users1'
      # else
      #   #redirect_to '/users1/new'
      # end
    end

    def update
      @user = Admin::User.find(params[:id])

      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
        params[:admin_user].delete(:password)
        params[:admin_user].delete(:password_confirmation)
      end

      respond_to do |format|
        if @user.update(user_params)
          format.html { render action: 'show', status: :created, location: @user }
          # format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }

        end
      end
      # if @user.update(user_params)
      #   #session[:user_i                      d] = @user.id
      #   redirect_to @user #'/users1'
      # else
      #   redirect_to '/users1/edit'
      # end
    end

    def destroy
      @user = Admin::User.find(params[:id])
      @user.destroy

      redirect_to admin_users_path
    end

    private

    def user_params
      # abort params.inspect
      params.require(:admin_user).permit(:login, :first_name, :name, :last_name, :email, :password, :password_confirmation, admin_role_ids: [])
    end


  end
end
