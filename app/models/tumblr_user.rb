require 'tumblife'
class TumblrUser
  include Mongoid::Document
  field :host, type: String
  field :consumer_key, type: String
  field :consumer_secret, type: String
  field :memo
  field :oauth_token, type: String
  field :oauth_token_secret, type: String
  field :spend, type: Integer, default: 0
  field :last_spend, type: Time, default: Time.mktime(2012,6,1)
  DailyMax  = 75
  ResetHour = 16

  def upload(uri)
    mash = ::Tumblife.client.photo("#{self.host}.tumblr.com",source: uri)
    self.spend += 1
    self.last_spend = Time.zone.now
    self.save
    mash.id 
  end

  def self.attend
    self.update
    attendee = self.all.select{|u|!u.max?}.sort_by{|u|u.last_spend}.reverse.first 
    raise "no man can upload(daily limit)" if !attendee
    attendee.tumblife_configure
  end

  def resetable?
    return true if !last_spend
    if last_spend.hour < ResetHour
      reset_time = last_spend.to_date.to_time + ResetHour*60*60
    else
      reset_time = last_spend.to_date.next_day.to_time + ResetHour*60*60
    end
    Time.zone.now > reset_time
  end

  def reset
    spend = 0
    last_spend = Time.zone.now
    save
  end

  def max?
    spend >= DailyMax
  end

  def tumblife_configure
    Tumblife.configure do |config|
      config.consumer_key       = self.consumer_key
      config.consumer_secret    = self.consumer_secret
      config.oauth_token        = self.oauth_token
      config.oauth_token_secret = self.oauth_token_secret
    end
    self
  end

  private

  def self.update
    self.all.each do |u|
      u.reset if u.resetable?
    end
  end

end
