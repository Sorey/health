class MedicalSetupsController < ApplicationController

  def medical_setups
    @medical_setups_h = Admin::MedicalSetup.get_medical_setups_group params[:medical_setups_group]

    group = Admin::MedicalSetupsGroup.get_group(params[:medical_setups_group])
    @medical_setups_group = group.name unless group.nil?
    set_title_page group.name unless group.nil?
  end

  def private_medical_setups
    @private_medical_setups = Admin::PrivateMedicalSetup.all.order(id: :asc)
    @header_title = "Приватні структури Вінницької області"
    set_title_page @header_title
  end
end
