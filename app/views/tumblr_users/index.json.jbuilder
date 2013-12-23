json.array!(@tumblr_users) do |tumblr_user|
  json.extract! tumblr_user, :host, :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret, :spend, :last_spend
  json.url tumblr_user_url(tumblr_user, format: :json)
end
