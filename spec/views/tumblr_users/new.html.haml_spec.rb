require 'spec_helper'

describe "tumblr_users/new" do
  before(:each) do
    assign(:tumblr_user, stub_model(TumblrUser,
      :host => "MyString",
      :consumer_key => "MyString",
      :consumer_secret => "MyString",
      :oath_token => "MyString",
      :oath_token_secret => "MyString"
    ).as_new_record)
  end

  it "renders new tumblr_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tumblr_users_path, "post" do
      assert_select "input#tumblr_user_host[name=?]", "tumblr_user[host]"
      assert_select "input#tumblr_user_consumer_key[name=?]", "tumblr_user[consumer_key]"
      assert_select "input#tumblr_user_consumer_secret[name=?]", "tumblr_user[consumer_secret]"
      assert_select "input#tumblr_user_oath_token[name=?]", "tumblr_user[oath_token]"
      assert_select "input#tumblr_user_oath_token_secret[name=?]", "tumblr_user[oath_token_secret]"
    end
  end
end
