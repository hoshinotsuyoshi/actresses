require 'spec_helper'
describe Photo do
  it { should have_fields(:path, :url, :secure_url, :big_url).of_type(String) }
  it { should belong_to(:actress)}
  it { should have_fields(:release_date).of_type(DateTime) }
  it { should have_fields(:point).of_type(Integer).with_default_value_of 0 }

  #scope specs
  it { expect(Photo.released  .selector["release_date"]["$lte"].class).to  eq(Time)} #FIXME
  it { expect(Photo.unreleased.selector["release_date"]["$gt" ].class).to  eq(Time)} #FIXME
end

describe Photo do
  #FIXME? (we can use stub_chain in order to use should_receive?)
  it "Photo#table" do
    Photo.stub_chain(:group, :map)
    Photo.table
  end
end

describe Photo do
  before{
    @photo = Photo.create!
  }
  it "#index" do
    @photo.stub_chain(:actress,:photos_sort_by_points,:index).with(@photo).and_return("ok")
    expect(@photo.index).to eq "ok"
  end
  it "#actress_photos_size" do
    @photo.stub_chain(:actress,:photos,:released,:size).and_return("ok")
    expect(@photo.actress_photos_size).to eq "ok"
  end
end
