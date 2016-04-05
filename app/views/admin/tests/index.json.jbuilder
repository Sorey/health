json.array!(@admin_tests) do |admin_test|
  json.extract! admin_test, :id, :question, :publish_on, :replies
  json.url admin_test_url(admin_test, format: :json)
end
