class MedicalSetup < ActiveRecord::Base
  has_one :medical_setup_license
  belongs_to :medical_setup_category
end
