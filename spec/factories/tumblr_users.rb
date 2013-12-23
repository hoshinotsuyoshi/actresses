# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tumblr_user do
    host "MyString"
    consumer_key "MyString"
    consumer_secret "MyString"
    oauth_token "MyString"
    oauth_token_secret "MyString"
    spend 1
    last_spend "2013-12-23 04:36:51"
  end
end
