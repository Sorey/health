class Admin::PeopleFilesController < ApplicationController
  before_action :set_admin_people_file, only: [:show, :edit, :update, :destroy]

  # GET /admin/people_files
  # GET /admin/people_files.json
  def index
    @admin_people_files = Admin::PeopleFile.all
  end

  # GET /admin/people_files/1
  # GET /admin/people_files/1.json
  def show
  end

  # GET /admin/people_files/new
  def new
    @admin_people_file = Admin::PeopleFile.new
  end

  # GET /admin/people_files/1/edit
  def edit
  end

  # POST /admin/people_files
  # POST /admin/people_files.json
  def create
    @admin_people_file = Admin::PeopleFile.new(admin_people_file_params)

    respond_to do |format|
      if @admin_people_file.save
        format.html { redirect_to @admin_people_file, notice: 'People file was successfully created.' }
        format.json { render :show, status: :created, location: @admin_people_file }
      else
        format.html { render :new }
        format.json { render json: @admin_people_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/people_files/1
  # PATCH/PUT /admin/people_files/1.json
  def update
    respond_to do |format|
      if @admin_people_file.update(admin_people_file_params)
        format.html { redirect_to @admin_people_file, notice: 'People file was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_people_file }
      else
        format.html { render :edit }
        format.json { render json: @admin_people_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/people_files/1
  # DELETE /admin/people_files/1.json
  def destroy
    @admin_people_file.destroy
    respond_to do |format|
      format.html { redirect_to admin_people_files_url, notice: 'People file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_people_file
      @admin_people_file = Admin::PeopleFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_people_file_params
      params.require(:admin_people_file).permit(:title, :description, :publish_on, :file)
    end
end
