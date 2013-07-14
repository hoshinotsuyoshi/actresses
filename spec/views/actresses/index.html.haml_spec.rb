require 'spec_helper'

describe "actresses/index" do
  before(:each) do
    assign(:actresses, [
      stub_model(Actress,
        :name => "Name",
        :text => "Text",
        :display => false
      ),
      stub_model(Actress,
        :name => "Name",
        :text => "Text",
        :display => false
      )
    ])
  end

  it "renders a list of actresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
