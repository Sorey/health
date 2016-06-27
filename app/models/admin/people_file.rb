class Admin::PeopleFile
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :publish_on, type: Mongoid::Boolean

  mount_uploader :file, FileDocumentUploader
  skip_callback :update, :before, :store_previous_model_for_file
end
