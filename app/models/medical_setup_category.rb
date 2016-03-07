class MedicalSetupCategory

  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  has_many :medical_setups
end
