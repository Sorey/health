class MedicalSetupsController < ApplicationController
  # before_action :authorize
  # before_action :require_role
  # before_action :require_admin, only: [:new, :destroy]
  # before_action :require_editor, only: [:edit]
  # before_action :require_admin, only: [:new, :destroy]
  # layout 'application_admin'

  def index
    @medical_setups_h = Admin::MedicalSetup.get_medical_setups_group params[:category]

    group = Admin::MedicalSetupsGroup.get_group(params[:category])
    @medical_setups_group = group.name unless group.nil?
  end

  def show_private_ms
    @private_medical_setups = Admin::PrivateMedicalSetup.all.order(id: :asc)
  end

  # def show
  #   @medical_setup = MedicalSetup.find(params[:id])
  # end
  #
  # def new
  #   @medical_setup = MedicalSetup.new
  # end
  #
  # def edit
  #   @medical_setup = MedicalSetup.find(params[:id])
  # end
  #
  # def create
  #   @medical_setup = MedicalSetup.new(medical_setup_params)
  #
  #   respond_to do |format|
  #     if @medical_setup.save
  #       format.html { redirect_to @medical_setup, notice: 'Medical_setup was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @medical_setup }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @medical_setup.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def update
  #   @medical_setup = MedicalSetup.find(params[:id])
  #
  #   respond_to do |format|
  #     if @medical_setup.update(medical_setup_params)
  #       format.html { redirect_to @medical_setup, notice: 'Medical_setup was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @medical_setup }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @medical_setup.errors, status: :unprocessable_entity }
  #
  #     end
  #   end
  # end
  #
  # def destroy
  #   @medical_setup = MedicalSetup.find(params[:id])
  #   @medical_setup.destroy
  #
  #   redirect_to medical_setups_path
  # end
  #
  # private
  #
  # def medical_setup_params
  #   params.require(:medical_setup).permit(:login, :first_name, :name, :last_name, :email, :password, :password_confirmation, :role_ids)
  # end

end
