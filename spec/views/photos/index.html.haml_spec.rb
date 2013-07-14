require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :path => "Path",
        :url => "Url",
        :secure_url => "Secure Url"
      ),
      stub_model(Photo,
        :path => "Path",
        :url => "Url",
        :secure_url => "Secure Url"
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Secure Url".to_s, :count => 2
  end
end
