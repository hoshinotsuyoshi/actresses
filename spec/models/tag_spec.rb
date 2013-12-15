require 'spec_helper'

describe Tag do
  it { should have_fields(:name, :_id, :text,).of_type(String) }
  it { should validate_uniqueness_of(:name) }
  it { should have_and_belong_to_many(:actresses)}
end

describe Tag do
  before{
    @tag = Tag.new(name: "My String")
  }
  it "id equals to name" do
    @tag.id.should eq(@tag.name)
  end

  it "#photos" do
    @tag.stub_chain(:actresses,:to_a,:map,:flatten).and_return("ok")
    expect(@tag.photos).to eq "ok"
  end

  it "#photos_sort_by_points" do
    @tag.stub_chain(:photos,:sort_by,:reverse).and_return("ok")
    expect(@tag.photos_sort_by_points).to eq "ok"
  end

  it "#page_size" do
    @tag.stub_chain(:photos,:size,:to_f,:/,:ceil).and_return("ok")
    expect(@tag.page_size).to eq "ok"
  end

end
