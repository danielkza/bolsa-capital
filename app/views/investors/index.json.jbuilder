json.array!(@investors) do |investor|
  json.extract! investor, :id, :name, :code, :owner
  json.url investor_url(investor, format: :json)
end
