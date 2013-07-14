require 'spec_helper'

describe "similar_actresses/show" do
  before(:each) do
    @similar_actress = assign(:similar_actress, stub_model(SimilarActress,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
