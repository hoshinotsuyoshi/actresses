require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :path => "Path",
      :url => "Url",
      :secure_url => "Secure Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Path/)
    rendered.should match(/Url/)
    rendered.should match(/Secure Url/)
  end
end
