json.array!(@tests) do |test|
  json.extract! test, :id, :question, :publish_on, :replies
  json.url test_url(test, format: :json)
end
