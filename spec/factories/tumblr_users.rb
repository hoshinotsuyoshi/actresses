# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tumblr_user do
    host "MyString"
    consumer_key "MyString"
    consumer_secret "MyString"
    oath_token "MyString"
    oath_token_secret "MyString"
  end
end
