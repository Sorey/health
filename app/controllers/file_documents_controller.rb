class FileDocumentsController < ApplicationController

  def category_file_documents
    # binding.pry
    @file_document_category = Admin::FileDocumentCategory.find_by(url_title: params[:file_document_category])
    @file_documents = Admin::FileDocument.where(admin_file_document_category_ids: @file_document_category.id)
  end
end