# coding: utf-8
require 'spec_helper'

describe "photos/photo" do
  before(:each) do
    mock_actress.stub!(:photos).and_return([mock_photo])

    assign(:actress, mock_actress)
    assign(:photo, mock_photo)
    assign(:actresses, [mock_actress])
    assign(:photos, [mock_photo])
    assign(:tags, [stub_model(Tag,name: "Name",text: "Text")])
  end

  it "renders the actress name and the photo" do
    render
    assert_select "h2", text: "ActressNameの画像"
    assert_select "img[src=?]", "big_url.jpg",count: 1
  end
  
  protected
  def mock_actress
    @mock_actress ||= mock_model(Actress, {
      name: "ActressName",
      text: "Text",
      display: true,
      release_date: Time.mktime(1970,1,1),
      similars: [],
      thumbnail_rand: ["url.jpg"],
    })
  end

  def mock_photo
    @mock_photo ||= mock_model(Photo,{
      path: "Path",
      big_url: "big_url.jpg",
      actress: mock_actress,
      actress_photos_size: 1,
      release_date: Time.mktime(1970,1,1),
      index: 0,
    })
  end

end
