json.array!(@polls) do |poll|
  json.extract! poll, :id, :question, :publish_on, :replies
  json.url admin_poll_url(poll, format: :json)
end
