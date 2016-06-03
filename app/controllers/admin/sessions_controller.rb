module Admin
  class SessionsController < AdminController
    skip_before_action :authorize
    skip_before_action :require_role

    def new
      # render layout: false
    end

    def create
      user = Admin::User.where(name: params[:name]).first
      user = Admin::User.where(email: params[:name]).first unless user

      user
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id.to_s
        # abort user.id.to_s.inspect

        redirect_to action: 'successful_login'
      else
        redirect_to admin_login_url, alert: "Invalid login/password combination"
      end
    end

    def successful_login

    end

    def destroy
      session[:user_id] = nil
      redirect_to  admin_login_url, alert: "Logged out"
    end
  end
end

