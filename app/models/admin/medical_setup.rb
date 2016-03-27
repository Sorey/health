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

end
