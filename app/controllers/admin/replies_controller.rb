class Admin::RepliesController < ApplicationController
  before_action :authorize
  before_action :require_role
  layout 'application_admin'
  def create
    @admin_test = Admin::Test.find(params[:test_id])
    @reply = @admin_test.admin_replies.create!(reply_params)
    redirect_to @admin_test, :notice => "Comment created!"
  end

  # private
  def reply_params
    params.require(:reply).permit(:answer)
  end
end
