class Admin::FileDocument
  include Mongoid::Document

  before_save :generate_title

  include Mongoid::Timestamps
  field :title, type: String
  field :year_publish, type: Date

  has_and_belongs_to_many :admin_file_document_categories, :class_name => 'Admin::FileDocumentCategory'

  mount_uploader :file, FileDocumentUploader
  skip_callback :update, :before, :store_previous_model_for_file

  def generate_title
    self.title = self.file_identifier unless self.title?
  end
end
