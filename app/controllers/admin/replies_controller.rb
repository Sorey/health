class Admin::RepliesController < Admin::AdminController
  before_action :set_reply

  def create
    respond_to do |format|
      if @poll.replies.create!(reply_params)
        format.html { redirect_to @poll, :notice => "Відповідь створена!"}
        format.json { render :show, status: :ok, location: @poll }
      else
        @reply = @poll.replies.find(params[:id])
        format.html { render 'admin/polls/show', :notice => "Відповідь створена."}
        format.json { render json: @reply.errors, status: :unprocessable_entity, location: [@poll, @reply] }
      end
    end
  end

  def edit
    @reply = @poll.replies.find(params[:id])
  end

  def update
    respond_to do |format|
      if @poll.replies.find(params[:id]).update(reply_params)
        format.html { redirect_to @poll, :notice => "Відповідь оновлена!" }
        format.json { render :show, status: :ok, location: @poll }
      else
        @reply = @poll.replies.find(params[:id])
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity, location: [@poll, @reply] }
      end
    end
  end

  def destroy
    @poll.replies.find(params[:id]).destroy
    redirect_to @poll, :notice => "Відповідь видалена!"
  end

  private

  def set_reply
    @poll = Admin::Poll.find(params[:poll_id])
  end

  def reply_params
    params.require(:reply).permit(:answer, :order_answer, :value)
  end
end
