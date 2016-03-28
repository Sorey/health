class Admin::MedicalSetup
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :phone, type: String
  field :head_doctor, type: String
  field :email, type: String
  field :number_license, type: String
  field :date_start, type: String
  field :date_finish, type: String
  field :medical_level, type: String

  # embedded_in :admin_medical_setup_category, :class_name => 'Admin::MedicalSetupCategory'
  # has_and_belongs_to_many :admin_medical_setup_category, :class_name => 'Admin::MedicalSetupCategory'
  belongs_to :admin_medical_setup_category, :class_name => 'Admin::MedicalSetupCategory'


  def self.get_medical_setups_group (group = '')
    @medical_setups = self.all.order(id: :asc)
    unless group == '' || group.nil?
      @medical_setups_group = Admin::MedicalSetupCategory.where(:name=> group).first
      @medical_setups = @medical_setups.where(:admin_medical_setup_category_id=> @medical_setups_group.id)
    end
    @medical_setups
  end
end
