json.array!(@photos) do |photo|
  json.extract! photo, :path, :url, :secure_url
  json.url photo_url(photo, format: :json)
end
