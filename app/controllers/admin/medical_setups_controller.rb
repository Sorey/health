class Admin::MedicalSetupsController < Admin::AdminController
  before_action :set_medical_setup, only: [:show, :edit, :update, :destroy]

  def index
    @medical_setups = Admin::MedicalSetup.get_medical_setups_group params[:category]
    @medical_setups = @medical_setups.where(:admin_medical_setup_category => params["group_select"]) unless params["group_select"].blank?
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

  def new
    @medical_setup = Admin::MedicalSetup.new
  end

  def edit
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
    @medical_setup.destroy
    redirect_to admin_medical_setups_path
  end

  private
  def set_medical_setup
    @medical_setup = Admin::MedicalSetup.find(params[:id])
  end

  def medical_setup_params
    params.require(:admin_medical_setup).permit(:name, :address, :phone, :head_doctor, :email, :number_license, :date_start, :date_finish, :medical_level, :admin_medical_setup_category_id)
  end
end
