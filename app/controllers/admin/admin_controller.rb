module Admin
  class AdminController  < ActionController::Base
    # protect_from_forgery with: :exception
    before_action :authorize
    before_action :require_role
    layout 'application_admin'

    helper_method :current_user

    # Ckeditor::PictureController

    def current_user
      # abort @current_user.inspect
      @current_user ||= Admin::User.find(session[:user_id]) if session[:user_id]
    end

    def require_role
      # abort session[:user_id].inspect
      redirect_to :back unless current_user.access?(params[:controller], params[:action])
    rescue ActionController::RedirectBackError
      redirect_to root_path
    end

    def authorize
      # User.find_by(id: session[:user_id])
      # abort session[:user_id].inspect
      # abort admin_login_url.inspect
      if session[:user_id].nil? || !Admin::User.find_by(id: session[:user_id])
        # abort admin_login_url.inspect
        redirect_to admin_login_url, notice: "Please log in"
      end
    end
  end
end