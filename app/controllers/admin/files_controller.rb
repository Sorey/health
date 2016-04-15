class Admin::FilesController < ApplicationController
  before_action :set_admin_file, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :require_role
  layout 'application_admin'

  # GET /admin/files
  # GET /admin/files.json
  def index
    @admin_files = Admin::File.all
  end

  # GET /admin/files/1
  # GET /admin/files/1.json
  def show
  end

  # GET /admin/files/new
  def new
    @admin_file = Admin::File.new
  end

  # GET /admin/files/1/edit
  def edit
  end

  # POST /admin/files
  # POST /admin/files.json
  def create
    @admin_file = Admin::File.new(admin_file_params)

    respond_to do |format|
      if @admin_file.save
        format.html { redirect_to @admin_file, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @admin_file }
      else
        format.html { render :new }
        format.json { render json: @admin_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/files/1
  # PATCH/PUT /admin/files/1.json
  def update
    # abort admin_file_params.inspect
    unless admin_file_params[:file].blank?
      @admin_file.remove_file!
    end

    respond_to do |format|
      if @admin_file.update(admin_file_params)
        format.html { redirect_to @admin_file, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_file }
      else
        format.html { render :edit }
        format.json { render json: @admin_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/files/1
  # DELETE /admin/files/1.json
  def destroy
    @admin_file.destroy
    respond_to do |format|
      format.html { redirect_to admin_files_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_file
      @admin_file = Admin::File.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_file_params
      params.require(:admin_file).permit(:file, :description)
    end
end
