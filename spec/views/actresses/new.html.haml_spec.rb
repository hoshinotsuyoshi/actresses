require 'spec_helper'

describe "actresses/new" do
  before(:each) do
    assign(:actress, stub_model(Actress,
      :name => "MyString",
      :text => "MyString",
      :display => false
    ).as_new_record)
  end

  it "renders new actress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", actresses_path, "post" do
      assert_select "input#actress_name[name=?]", "actress[name]"
      assert_select "input#actress_text[name=?]", "actress[text]"
      assert_select "input#actress_display[name=?]", "actress[display]"
    end
  end
end
