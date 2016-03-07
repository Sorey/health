class MedicalSetup
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  has_one :medical_setup_license
  belongs_to :medical_setup_category
end
