json.array!(@admin_videos) do |admin_video|
  json.extract! admin_video, :id, :title, :iframe, :publish_on, :description
  json.url admin_video_url(admin_video, format: :json)
end
