require 'spec_helper'

describe "similar_actresses/new" do
  before(:each) do
    assign(:similar_actress, stub_model(SimilarActress,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new similar_actress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", similar_actresses_path, "post" do
      assert_select "input#similar_actress_name[name=?]", "similar_actress[name]"
    end
  end
end
