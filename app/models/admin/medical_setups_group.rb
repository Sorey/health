class Admin::MedicalSetupsGroup
  include Mongoid::Document
  field :name, type: String

  # embeds_many :admin_medical_setups, :class_name => 'Admin::MedicalSetup'
  # has_and_belongs_to_many :admin_medical_setups, :class_name => 'Admin::MedicalSetup'
  has_many :admin_medical_setups, :class_name => 'Admin::MedicalSetup'

  def self.get_group group
    where(:name=> group).first
  end
end
