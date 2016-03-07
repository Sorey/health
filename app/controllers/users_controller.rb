class UsersController < ApplicationController
  before_action :authorize
  before_action :require_role
  # before_action :require_admin, only: [:new, :destroy]
  # before_action :require_editor, only: [:edit]
  # before_action :require_admin, only: [:new, :destroy]
  layout 'application_admin'

  def index
     # /////abort User.all.inspect
    #
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # if :require_admin
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
        # else
        #   session[:user_id] = @user.id
        #   format.html { render action: 'users', notice: 'User was successfully created!!!' }
        #   format.json { render action: '/', status: :created, location: @user }
        # end
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    # if @user.save
    #   #session[:user_id] = @user.id
    #   redirect_to @user #'/users'
    # else
    #   #redirect_to '/users/new'
    # end
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
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
    # if @user.update(user_params)
    #   #session[:user_i                      d] = @user.id
    #   redirect_to @user #'/users'
    # else
    #   redirect_to '/users/edit'
    # end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:login, :first_name, :name, :last_name, :email, :password, :password_confirmation, role_ids: [])
  end


end
