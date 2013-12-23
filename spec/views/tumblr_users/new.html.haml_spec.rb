require 'spec_helper'

describe "tumblr_users/new" do
  before(:each) do
    assign(:tumblr_user, stub_model(TumblrUser,
      :host => "MyString",
      :consumer_key => "MyString",
      :consumer_secret => "MyString",
      :oauth_token => "MyString",
      :oauth_token_secret => "MyString",
      :spend => 1
    ).as_new_record)
  end

  it "renders new tumblr_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tumblr_users_path, "post" do
      assert_select "input#tumblr_user_host[name=?]", "tumblr_user[host]"
      assert_select "input#tumblr_user_consumer_key[name=?]", "tumblr_user[consumer_key]"
      assert_select "input#tumblr_user_consumer_secret[name=?]", "tumblr_user[consumer_secret]"
      assert_select "input#tumblr_user_oauth_token[name=?]", "tumblr_user[oauth_token]"
      assert_select "input#tumblr_user_oauth_token_secret[name=?]", "tumblr_user[oauth_token_secret]"
      assert_select "input#tumblr_user_spend[name=?]", "tumblr_user[spend]"
    end
  end
end
