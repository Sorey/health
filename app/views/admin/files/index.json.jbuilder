json.array!(@admin_files) do |admin_file|
  json.extract! admin_file, :id, :file, :description
  json.url admin_file_url(admin_file, format: :json)
end
