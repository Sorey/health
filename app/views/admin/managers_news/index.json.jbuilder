json.array!(@admin_managers_news) do |admin_for_manager|
  json.extract! admin_for_manager, :id, :title, :date_start, :publish_on, :description
  json.url admin_for_manager_url(admin_for_manager, format: :json)
end
