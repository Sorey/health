class MedicalSetupLicense
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
end
