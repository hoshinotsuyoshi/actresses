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

  #FIXME? (we can use stub_chain in order to use should_receive?)
  it "#photos" do
    @tag.stub_chain(:actresses,:to_a,:map,:flatten)
    @tag.photos
  end

  it "#photos_sort_by_points" do
    @tag.stub_chain(:photos,:sort_by,:reverse)
    @tag.photos
  end

  it "#page_size" do
    @tag.stub_chain(:photos,:size,:to_f,:/,:ceil)
    @tag.page_size
  end

end
