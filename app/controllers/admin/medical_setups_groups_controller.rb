class Admin::MedicalSetupsGroupsController < Admin::AdminController
  before_action :set_medical_setups_group, only: [:show, :edit, :update, :destroy]

  def index
    @medical_setups_groups = Admin::MedicalSetupsGroup.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

  def new
    @medical_setups_group = Admin::MedicalSetupsGroup.new
  end

  def edit
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
    @medical_setups_group.destroy
    redirect_to admin_medical_setups_groups_path
  end

  private
  def set_medical_setups_group
    @medical_setups_group = Admin::MedicalSetupsGroup.find(params[:id])
  end

  def medical_setups_group_params
    params.require(:admin_medical_setups_group).permit(:name, :ang_name)
  end
end
