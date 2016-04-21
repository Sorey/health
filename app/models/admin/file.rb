class Admin::File
  include Mongoid::Document
  require 'carrierwave/mongoid'

  include Mongoid::Timestamps
  field :file, type: String
  field :description, type: String

  validates :description,  length: { minimum: 10, maximum: 1000, message: "мінімально 10, максимально 1000 символів."}

  mount_uploader :file, FileUploader
  skip_callback :update, :before, :store_previous_model_for_file
end
