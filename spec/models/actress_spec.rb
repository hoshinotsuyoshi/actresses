require 'spec_helper'
describe Actress do
  it { should have_fields(:name, :_id, :text,).of_type(String) }
  it { should have_fields(:release_date      ).of_type(DateTime) }
  it { should have_fields(:display           ).of_type(String).with_default_value_of "1" }

  it { should validate_uniqueness_of(:name) }
  it { should have_many(:photos).with_foreign_key(:actress_id)}
  it { should have_and_belong_to_many(:tags)}
  #scope specs
  it { expect(Actress.display   .selector).to  eq({"display"=>"1"})}
  it { expect(Actress.released  .selector["release_date"]["$lte"].class).to  eq(Time)} #FIXME
  it { expect(Actress.unreleased.selector["release_date"]["$gt" ].class).to  eq(Time)} #FIXME
end

describe Actress do
  before{
    @actress = Actress.new(name: "My String")
    @photo   = Photo.create!(path: "My String")
    @actress.photo_ids = [@photo.id]
  }
  it "id equals to name" do
    @actress.id.should eq(@actress.name)
  end

  #FIXME? (we can use stub_chain in order to use should_receive?)
  it "#thumbnail_rand" do
    @actress.stub_chain(:photos_sort_by_points,:map,:[])
    @actress.thumbnail_rand
  end

  it "photos_sort_by_points" do
    @actress.stub_chain(:photos,:released,:sort_by,:reverse)
    @actress.photos_sort_by_points
  end

  it "photos_sort_by_release_date" do
    @actress.stub_chain(:photos,:released,:sort_by)
    @actress.photos_sort_by_release_date
  end

  it "#page_size" do
    @actress.stub_chain(:photos,:released,:size,:to_f,:/,:ceil)
    @actress.page_size
  end

end
