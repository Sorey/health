json.array!(@admin_statistic_catalogs) do |admin_statistic_catalog|
  json.extract! admin_statistic_catalog, :id
  json.url admin_statistic_catalog_url(admin_statistic_catalog, format: :json)
end
