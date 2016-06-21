json.array!(@admin_file_document_categories) do |admin_file_document_category|
  json.extract! admin_file_document_category, :id
  json.url admin_file_document_category_url(admin_file_document_category, format: :json)
end
