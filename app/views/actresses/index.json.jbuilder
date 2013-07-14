json.array!(@actresses) do |actress|
  json.extract! actress, :name, :text, :display
  json.url actress_url(actress, format: :json)
end
