require 'spec_helper'

describe "similar_actresses/edit" do
  before(:each) do
    @similar_actress = assign(:similar_actress, stub_model(SimilarActress,
      :name => "MyString"
    ))
  end

  it "renders the edit similar_actress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", similar_actress_path(@similar_actress), "post" do
      assert_select "input#similar_actress_name[name=?]", "similar_actress[name]"
    end
  end
end
