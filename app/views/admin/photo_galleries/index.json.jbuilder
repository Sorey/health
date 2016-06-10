json.array!(@admin_photo_galleries) do |admin_photo_gallery|
  json.extract! admin_photo_gallery, :id, :title, :description, :publish_on
  json.url admin_photo_gallery_url(admin_photo_gallery, format: :json)
end
