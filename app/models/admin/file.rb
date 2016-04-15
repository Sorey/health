class Admin::File
  include Mongoid::Document
  require 'carrierwave/mongoid'


  field :file, type: String
  field :description, type: String

  mount_uploader :file, FileUploader
  skip_callback :update, :before, :store_previous_model_for_file
end
