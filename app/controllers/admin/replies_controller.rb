class Admin::RepliesController < Admin::AdminController
  before_action :set_reply

  def create
    respond_to do |format|
      if @poll.replies.create!(reply_params)
        format.html { redirect_to @poll, :notice => "Comment created!"}
        format.json { render :show, status: :ok, location: @poll }
        # abort @reply.inspect
      else
        abort @reply.inspect
        @reply = @poll.replies.find(params[:id])
        abort @reply.inspect
        format.html { render 'admin/polls/show'}
        format.json { render json: @reply.errors, status: :unprocessable_entity, location: [@poll, @reply] }
      end
    end
    # @@poll.replies.create!(reply_params)
    # redirect_to @@poll, :notice => "Comment created!"
  end
  def edit
    @poll = Admin::Poll.find(params[:poll_id])
    @reply = @poll.replies.find(params[:id])
  end
  def update
    respond_to do |format|
      if @poll.replies.find(params[:id]).update(reply_params)
        format.html { redirect_to @poll, :notice => "Comment deleted!" }
        format.json { render :show, status: :ok, location: @poll }
      else
        @reply = @poll.replies.find(params[:id])
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity, location: [@poll, @reply] }
      end
    end



    # @@@poll.replies.find(params[:id]).update(reply_params)
    # # @@@poll.replies.create!(reply_params)
    # redirect_to @@@poll, :notice => "Comment deleted!"
  end

  def destroy
    @poll.replies.find(params[:id]).destroy
    redirect_to @poll, :notice => "Comment deleted!"
  end

  private

  def set_reply
    # abort params.inspect
    @poll = Admin::Poll.find(params[:poll_id])
  end

  def reply_params
    params.require(:reply).permit(:answer, :order_answer, :value)
  end
end
