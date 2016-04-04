class Admin::PrivateMedicalSetup
  include Mongoid::Document
  field :name, type: String
  field :address, type: String

  # validates :name,  length: { minimum: 10, maximum: 200}, :presence => true
  # validates :address, length: { minimum: 10, maximum: 200}
end
