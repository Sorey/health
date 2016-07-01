class FileDocumentsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def category_file_documents
    @file_document_category = Admin::FileDocumentCategory.find_by(url_title: params[:file_document_category])
    @file_documents = Admin::FileDocument.where(admin_file_document_category_ids: @file_document_category.id)
    @file_documents = @file_documents.order(sort_column + " " + sort_direction)
    @file_documents = @file_documents.page(params[:page]).per(25)

    set_title_page @file_document_category.title
    respond_to do |format|
      format.js
      format.html
    end
  end

  def sort_column
    Admin::FileDocument.fields.keys.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end