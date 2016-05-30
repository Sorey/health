module Admin
  class SessionsController < AdminController
    skip_before_action :authorize
    skip_before_action :require_role

    def new
      # render layout: false
    end

    def create
      user = Admin::User.find_by(name: params[:name])
      unless user
        user = Admin::User.find_by(email: params[:name])
      end
      user
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id.to_s
        # abort user.id.to_s.inspect

        redirect_to action: 'successful_login'
      else
        redirect_to admin_login_url, alert: "Invalid user/password combination"
      end
    end

    def successful_login

    end

    def destroy
      session[:user_id] = nil
      redirect_to  admin_login_url, notice: "Logged out"
    end
  end
end

