json.array!(@admin_people_files) do |admin_people_file|
  json.extract! admin_people_file, :id, :title, :description, :publish_on
  json.url admin_people_file_url(admin_people_file, format: :json)
end
