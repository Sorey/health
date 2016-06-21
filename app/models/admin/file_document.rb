class Admin::FileDocument
  include Mongoid::Document

  include Mongoid::Timestamps
  field :title, type: String
  field :file_name, type: String
  field :year_publication, type: Date

  has_and_belongs_to_many :admin_file_document_categories, :class_name => 'Admin::FileDocumentCategory'
end
