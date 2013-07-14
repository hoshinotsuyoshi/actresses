require 'spec_helper'

describe "similar_actresses/index" do
  before(:each) do
    assign(:similar_actresses, [
      stub_model(SimilarActress,
        :name => "Name"
      ),
      stub_model(SimilarActress,
        :name => "Name"
      )
    ])
  end

  it "renders a list of similar_actresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
