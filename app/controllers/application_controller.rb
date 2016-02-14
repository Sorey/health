class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_role
    redirect_to :back unless current_user.access?(params[:controller], params[:action])
  end

  # def require_editor
  #   redirect_to '/' unless current_user.editor?  # || current_user.admin?
  #   # ----------------- test data from controller to model -----------
  #   # redirect_to '/' unless current_user.editor?(params[:controller])
  # end
  #
  # def require_admin
  #   redirect_to :back unless current_user.admin?
  # end

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to admin_login_url, notice: "Please log in"
      end
    end
end
