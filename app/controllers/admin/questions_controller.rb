class Admin::QuestionsController < ApplicationController
  before_action :set_admin_test, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :require_role
  layout 'application_admin'

  # GET /admin/tests
  # GET /admin/tests.json
  def index
    @admin_questions = Admin::Question.all
  end

  # GET /admin/tests/1
  # GET /admin/tests/1.json
  def show
    # abort @@admin_question.replies.inspect
    # @@admin_question.admin_replies << Admin::Reply.new

    @reply = Reply.new
    # @new_reply = @@admin_question.admin_replies.build
    # @@admin_question = Admin::Test.find(params[:id])
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @admin_question }
    # end
  end

  # GET /admin/tests/new
  def new
    @admin_question = Admin::Question.new
  end

  # GET /admin/tests/1/edit
  def edit
  end

  # POST /admin/tests
  # POST /admin/tests.json
  def create
    @admin_question = Admin::Question.new(admin_test_params)

    respond_to do |format|
      if @admin_question.save
        format.html { redirect_to @admin_question, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @admin_question }
      else
        format.html { render :new }
        format.json { render json: @admin_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tests/1
  # PATCH/PUT /admin/tests/1.json
  def update
    respond_to do |format|
      if @admin_question.update(admin_test_params)
        format.html { redirect_to @admin_question, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_question }
      else
        format.html { render :edit }
        format.json { render json: @admin_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tests/1
  # DELETE /admin/tests/1.json
  def destroy
    @admin_question.destroy
    respond_to do |format|
      format.html { redirect_to admin_tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_test
      @admin_question = Admin::Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_test_params
      params.require(:admin_question).permit(:question, :publish_on, :admin_replies)
    end
end
