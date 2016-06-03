module Admin
  class AdminController  < ActionController::Base
    # protect_from_forgery with: :exception
    before_action :authorize
    before_action :require_role
    layout 'application_admin'

    helper_method :current_user

    # Ckeditor::PictureController

    def current_user
      # get current_user or if current_user not found authorise other user
      @current_user ||= Admin::User.find(session[:user_id]) if session[:user_id]
    rescue Mongoid::Errors::DocumentNotFound => e
      session[:user_id] = nil
      redirect_to admin_login_url, alert: "Даний користувач був видалений із системи."
      return
    end

    def require_role
      # abort session[:user_id].inspect
      redirect_to :back unless current_user.access?(params[:controller], params[:action])
    rescue ActionController::RedirectBackError
      redirect_to root_path
    end

    def authorize
      if session[:user_id].nil? || !Admin::User.find_by(id: session[:user_id])
        # abort admin_login_url.inspect
        redirect_to admin_login_url, alert: "Зареєструйтесь!"
      end
    end
  end
end