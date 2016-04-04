class Admin::PrivateMedicalSetupsController < ApplicationController
  before_action :set_admin_private_medical_setup, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :require_role
  # before_action :require_admin, only: [:new, :destroy]
  # before_action :require_editor, only: [:edit]
  # before_action :require_admin, only: [:new, :destroy]
  layout 'application_admin'
  # GET /admin/private_medical_setups
  # GET /admin/private_medical_setups.json
  def index
    @private_medical_setups = Admin::PrivateMedicalSetup.all.order(id: :asc)
  end

  # GET /admin/private_medical_setups/1
  # GET /admin/private_medical_setups/1.json
  def show
  end

  # GET /admin/private_medical_setups/new
  def new
    @private_medical_setup = Admin::PrivateMedicalSetup.new
  end

  # GET /admin/private_medical_setups/1/edit
  def edit
  end

  # POST /admin/private_medical_setups
  # POST /admin/private_medical_setups.json
  def create
    @private_medical_setup = Admin::PrivateMedicalSetup.new(admin_private_medical_setup_params)

    respond_to do |format|
      if @private_medical_setup.save
        format.html { redirect_to @private_medical_setup, notice: 'Private medical setup was successfully created.' }
        format.json { render :show, status: :created, location: @private_medical_setup }
      else
        format.html { render :new }
        format.json { render json: @private_medical_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/private_medical_setups/1
  # PATCH/PUT /admin/private_medical_setups/1.json
  def update
    respond_to do |format|
      if @private_medical_setup.update(admin_private_medical_setup_params)
        format.html { redirect_to @private_medical_setup, notice: 'Private medical setup was successfully updated.' }
        format.json { render :show, status: :ok, location: @private_medical_setup }
      else
        format.html { render :edit }
        format.json { render json: @private_medical_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/private_medical_setups/1
  # DELETE /admin/private_medical_setups/1.json
  def destroy
    @private_medical_setup.destroy
    respond_to do |format|
      format.html { redirect_to admin_private_medical_setups_url, notice: 'Private medical setup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_private_medical_setup
      @private_medical_setup = Admin::PrivateMedicalSetup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_private_medical_setup_params
      params.require(:admin_private_medical_setup).permit(:name, :address)
    end
end
