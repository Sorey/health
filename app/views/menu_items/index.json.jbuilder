json.array!(@menu_items) do |menu_item|
  json.extract! menu_item, :id, :type_way, :type_item, :title, :parent_id
  json.url menu_item_url(menu_item, format: :json)
end
