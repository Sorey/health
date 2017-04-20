json.array!(@admin_statistic_galleries) do |admin_statistic_gallery|
  json.extract! admin_statistic_gallery, :id, :title, :publish_on, :meta_keywords, :meta_description, :description
  json.url admin_statistic_gallery_url(admin_statistic_gallery, format: :json)
end
