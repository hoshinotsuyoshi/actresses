require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :path => "MyString",
      :url => "MyString",
      :secure_url => "MyString"
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_path[name=?]", "photo[path]"
      assert_select "input#photo_url[name=?]", "photo[url]"
      assert_select "input#photo_secure_url[name=?]", "photo[secure_url]"
    end
  end
end
