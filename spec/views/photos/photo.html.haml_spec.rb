# coding: utf-8
require 'spec_helper'

describe "photos/photo" do
  before(:each) do
    Actress.delete_all
    Photo.delete_all
    actress = Actress.create!(name: "ActressName",text: "Text",display: true, release_date: Time.mktime(1970,1,1))
    photo   = Photo.create!(path: "Path",big_url: "big_url.jpg", actress: actress, release_date: Time.mktime(1970,1,1))
    assign(:actress, actress)
    assign(:photo, photo)
    assign(:actresses, [actress])
    assign(:photos, [photo])
    assign(:tags, [stub_model(Tag,name: "Name",text: "Text")])
  end

  it "renders the actress name and the photo" do
    render
    assert_select "h2", text: "ActressNameの画像"
    assert_select "img[src=?]", "big_url.jpg",count: 1
  end
  
  after(:each) do
    Actress.delete_all
    Photo.delete_all
  end
end
