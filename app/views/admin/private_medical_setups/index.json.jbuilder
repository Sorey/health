json.array!(@private_medical_setups) do |admin_private_medical_setup|
  json.extract! admin_private_medical_setup, :id
  json.url admin_private_medical_setup_url(admin_private_medical_setup, format: :json)
end
