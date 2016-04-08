class Admin::PollsController < ApplicationController
  before_action :set_admin_test, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :require_role
  layout 'application_admin'

  # GET /admin/tests
  # GET /admin/tests.json
  def index
    @polls = Admin::Poll.all
  end

  # GET /admin/tests/1
  # GET /admin/tests/1.json
  def show
    # abort @@@poll.replies.inspect
    # @@@poll.admin_replies << Admin::Reply.new

    @reply = Reply.new
    # @new_reply = @@@poll.admin_replies.build
    # @@@poll = Admin::Test.find(params[:id])
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @@poll }
    # end
  end

  # GET /admin/tests/new
  def new
    @poll = Admin::Poll.new
  end

  # GET /admin/tests/1/edit
  def edit
  end

  # POST /admin/tests
  # POST /admin/tests.json
  def create
    @poll = Admin::Poll.new(admin_poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tests/1
  # PATCH/PUT /admin/tests/1.json
  def update
    respond_to do |format|
      if @poll.update(admin_poll_params)
        format.html { redirect_to @poll, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tests/1
  # DELETE /admin/tests/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to admin_polls_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_test
      @poll = Admin::Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_poll_params
      # abort params.inspect
      params.require(:admin_poll).permit(:question, :order_question, :publish_on, :replies)
    end
end
