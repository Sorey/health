class Admin::MedicalSetupCategory
  include Mongoid::Document
  field :name, type: String

  # embeds_many :admin_medical_setups, :class_name => 'Admin::MedicalSetup'
  # has_and_belongs_to_many :admin_medical_setups, :class_name => 'Admin::MedicalSetup'
  has_many :admin_medical_setups, :class_name => 'Admin::MedicalSetup'
end
