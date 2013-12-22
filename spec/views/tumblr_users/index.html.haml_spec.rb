require 'spec_helper'

describe "tumblr_users/index" do
  before(:each) do
    assign(:tumblr_users, [
      stub_model(TumblrUser,
        :host => "Host",
        :consumer_key => "Consumer Key",
        :consumer_secret => "Consumer Secret",
        :oath_token => "Oath Token",
        :oath_token_secret => "Oath Token Secret",
        :spend => 1
      ),
      stub_model(TumblrUser,
        :host => "Host",
        :consumer_key => "Consumer Key",
        :consumer_secret => "Consumer Secret",
        :oath_token => "Oath Token",
        :oath_token_secret => "Oath Token Secret",
        :spend => 1
      )
    ])
  end

  it "renders a list of tumblr_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Consumer Key".to_s, :count => 2
    assert_select "tr>td", :text => "Consumer Secret".to_s, :count => 2
    assert_select "tr>td", :text => "Oath Token".to_s, :count => 2
    assert_select "tr>td", :text => "Oath Token Secret".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
