# coding: utf-8
require 'spec_helper'

describe "actresses/index_photos" do
  before(:each) do
    assign(:picked, [
      stub_model(Actress,
        :name => "Name",
        :text => "Text",
        :pick_up => 1,
        :display => 1
      ),
      stub_model(Actress,
        :name => "Name",
        :text => "Text",
        :pick_up => 1,
        :display => 1
      )
    ])
  end

  it "renders a list of actresses" do
    render
    assert_select "ul>li>a", text: "Name 0枚", count: 2
    assert_select "ul>li>a>img", count: 2
  end
end
