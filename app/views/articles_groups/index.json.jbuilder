json.array!(@articles_groups) do |articles_group|
  json.extract! articles_group, :id
  json.url articles_group_url(articles_group, format: :json)
end
