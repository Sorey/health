json.array!(@admin_file_documents) do |admin_file_document|
  json.extract! admin_file_document, :id
  json.url admin_file_document_url(admin_file_document, format: :json)
end
