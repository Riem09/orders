json.array!(@posts) do |post|
  json.extract! post, :id, :name, :order, :extra
  json.url post_url(post, format: :json)
end
