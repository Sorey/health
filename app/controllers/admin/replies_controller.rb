class Admin::RepliesController < ApplicationController
  before_action :set_reply
  before_action :authorize
  before_action :require_role
  layout 'application_admin'
  def create
    respond_to do |format|
      if @admin_question.replies.create(reply_params)
        format.html { redirect_to @admin_question, :notice => "Comment created!"}
        format.json { render :show, status: :ok, location: @admin_question }
        # abort @reply.inspect
      else
        abort @reply.inspect
        @reply = @admin_question.replies.find(params[:id])
        abort @reply.inspect
        format.html { render 'admin/questions/show'}
        format.json { render json: @new_reply.errors, status: :unprocessable_entity, location: [@admin_question, @reply] }
      end
    end
    # @admin_question.replies.create!(reply_params)
    # redirect_to @admin_question, :notice => "Comment created!"
  end
  def edit
    @admin_question = Admin::Question.find(params[:question_id])
    @reply = @admin_question.replies.find(params[:id])
  end
  def update
    respond_to do |format|
      if @admin_question.replies.find(params[:id]).update(reply_params)
        format.html { redirect_to @admin_question, :notice => "Comment deleted!" }
        format.json { render :show, status: :ok, location: @admin_question }
      else
        @reply = @admin_question.replies.find(params[:id])
        format.html { render :edit }
        format.json { render json: @new_reply.errors, status: :unprocessable_entity, location: [@admin_question, @reply] }
      end
    end



    # @@admin_question.replies.find(params[:id]).update(reply_params)
    # # @@admin_question.replies.create!(reply_params)
    # redirect_to @@admin_question, :notice => "Comment deleted!"
  end

  def destroy
    @admin_question.replies.find(params[:id]).destroy
    redirect_to @admin_question, :notice => "Comment deleted!"
  end

  private

  def set_reply
    @admin_question = Admin::Question.find(params[:question_id])
  end

  def reply_params
    params.require(:reply).permit(:answer)
  end
end
