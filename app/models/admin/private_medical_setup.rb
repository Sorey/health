class Admin::PrivateMedicalSetup
  include Mongoid::Document
  field :name, type: String
  field :address, type: String

  validates :name,  length: { minimum: 5, maximum: 200, message: "(Назва): мінімально 5, максимально 200 символів."}
  # validates :address, length: { minimum: 10, maximum: 200}
end
