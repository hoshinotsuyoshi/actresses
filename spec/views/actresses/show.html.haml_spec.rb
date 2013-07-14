require 'spec_helper'

describe "actresses/show" do
  before(:each) do
    @actress = assign(:actress, stub_model(Actress,
      :name => "Name",
      :text => "Text",
      :display => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Text/)
    rendered.should match(/false/)
  end
end
