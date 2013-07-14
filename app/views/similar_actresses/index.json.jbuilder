json.array!(@similar_actresses) do |similar_actress|
  json.extract! similar_actress, :name
  json.url similar_actress_url(similar_actress, format: :json)
end
