class Admin::PollsController < Admin::AdminController
  before_action :set_admin_test, only: [:show, :edit, :update, :destroy]

  def index
    @polls = Admin::Poll.all.order(order_question: 1)
  end

  def show
    @reply = Reply.new
  end

  def new
    @poll = Admin::Poll.new
  end

  def edit
  end

  def create
    @poll = Admin::Poll.new(admin_poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Опитування успішно створено.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @poll.update(admin_poll_params)
        format.html { redirect_to @poll, notice: 'Опитування успішно оновлено.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to admin_polls_url, notice: 'Опитуваня видалено.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_test
      @poll = Admin::Poll.find(params[:id])
    end

    def admin_poll_params
      params.require(:admin_poll).permit(:question, :order_question, :publish_on, :replies)
    end
end
