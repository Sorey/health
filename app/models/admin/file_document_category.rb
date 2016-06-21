class Admin::FileDocumentCategory
  include Mongoid::Document

  field :title, type: String
  field :url_title, type: String


  has_and_belongs_to_many :admin_file_documents, :class_name => 'Admin::FileDocument'
  belongs_to :admin_role, :class_name => 'Admin::Role'
end
