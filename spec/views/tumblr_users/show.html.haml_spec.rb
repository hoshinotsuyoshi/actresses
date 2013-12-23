require 'spec_helper'

describe "tumblr_users/show" do
  before(:each) do
    @tumblr_user = assign(:tumblr_user, stub_model(TumblrUser,
      :host => "Host",
      :consumer_key => "Consumer Key",
      :consumer_secret => "Consumer Secret",
      :oauth_token => "Oauth Token",
      :oauth_token_secret => "Oauth Token Secret",
      :spend => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Host/)
    rendered.should match(/Consumer Key/)
    rendered.should match(/Consumer Secret/)
    rendered.should match(/Oauth Token/)
    rendered.should match(/Oauth Token Secret/)
    rendered.should match(/1/)
  end
end
