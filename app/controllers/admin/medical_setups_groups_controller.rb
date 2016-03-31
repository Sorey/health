class Admin::MedicalSetupsGroupsController < ApplicationController
  before_action :authorize
  before_action :require_role
  # before_action :require_admin, only: [:new, :destroy]
  # before_action :require_editor, only: [:edit]
  # before_action :require_admin, only: [:new, :destroy]
  layout 'application_admin'

  def index
    @medical_setups_groups = Admin::MedicalSetupsGroup.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @medical_setups_group = Admin::MedicalSetupsGroup.find(params[:id])
  end

  def new
    @medical_setups_group = Admin::MedicalSetupsGroup.new
  end

  def edit
    @medical_setups_group = Admin::MedicalSetupsGroup.find(params[:id])
  end

  def create
    @medical_setups_group = Admin::MedicalSetupsGroup.new(medical_setups_group_params)

    respond_to do |format|
      if @medical_setups_group.save
        format.html { redirect_to admin_medical_setups_groups_url, notice: 'Medical_setups_group was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @medical_setups_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical_setups_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @medical_setups_group = Admin::MedicalSetupsGroup.find(params[:id])

    respond_to do |format|
      if @medical_setups_group.update(medical_setups_group_params)
        format.html { redirect_to admin_medical_setups_groups_url, notice: 'Medical_setups_group was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @medical_setups_group }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_setups_group.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @medical_setups_group = Admin::MedicalSetupsGroup.find(params[:id])
    @medical_setups_group.destroy

    redirect_to admin_medical_setups_groups_path
  end

  private

  def medical_setups_group_params
    params.require(:admin_medical_setups_group).permit(:name)
  end
end
