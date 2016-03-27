class Admin::MedicalSetupsController < ApplicationController
  before_action :authorize
  before_action :require_role
  # before_action :require_admin, only: [:new, :destroy]
  # before_action :require_editor, only: [:edit]
  # before_action :require_admin, only: [:new, :destroy]
  layout 'application_admin'

  def index
    # /////abort User.all.inspect
    #
    @medical_setups = Admin::MedicalSetup.all.order(id: :asc)
    @medical_setups_group = Admin::MedicalSetupCategory.where(:name=> params[:category]).first unless params[:category].blank?
    @medical_setups = @medical_setups.where(:admin_medical_setup_category_id=> @medical_setups_group.id) unless params[:category].blank?

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @medical_setup = Admin::MedicalSetup.find(params[:id])
  end

  def new
    @medical_setup = Admin::MedicalSetup.new
  end

  def edit
    @medical_setup = Admin::MedicalSetup.find(params[:id])
  end

  def create
    @medical_setup = Admin::MedicalSetup.new(medical_setup_params)

    respond_to do |format|
      if @medical_setup.save
        format.html { redirect_to @medical_setup, notice: 'Medical_setup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medical_setup }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @medical_setup = Admin::MedicalSetup.find(params[:id])

    respond_to do |format|
      if @medical_setup.update(medical_setup_params)
        format.html { redirect_to @medical_setup, notice: 'Medical_setup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medical_setup }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_setup.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @medical_setup = Admin::MedicalSetup.find(params[:id])
    @medical_setup.destroy

    redirect_to admin_medical_setups_path
  end

  private

  def medical_setup_params
    params.require(:admin_medical_setup).permit(:name, :address, :phone, :head_doctor, :email, :number_license, :date_start, :date_finish, :medical_level, :admin_medical_setup_category_id)
  end
end
