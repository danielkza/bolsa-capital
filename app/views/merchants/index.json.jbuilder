json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :name, :code, :owner, :address
  json.url merchant_url(merchant, format: :json)
end
