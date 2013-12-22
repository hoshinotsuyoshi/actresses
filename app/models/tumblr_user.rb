class TumblrUser
  include Mongoid::Document
  field :host, type: String
  field :consumer_key, type: String
  field :consumer_secret, type: String
  field :oath_token, type: String
  field :oath_token_secret, type: String
  field :spend, type: Integer
  field :last_spend, type: Time
  DailyMax = 75

  def self.attend

  end
end
