class Admin::RepliesController < ApplicationController
  before_action :authorize
  before_action :require_role
  layout 'application_admin'
  def create
    @test = Admin::Test.find(params[:_id])
    @reply = @test.admin_replies.create!(params[:answer])
    redirect_to @test, :notice => "Comment created!"
  end
end
