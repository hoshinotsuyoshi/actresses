json.array!(@tumblr_users) do |tumblr_user|
  json.extract! tumblr_user, :host, :consumer_key, :consumer_secret, :oath_token, :oath_token_secret
  json.url tumblr_user_url(tumblr_user, format: :json)
end
