require 'spec_helper'

describe Api do
  it ".create!" do
    Api::Response.should_receive(:build).with(nil)
    Api.create!
  end
end
describe Api::Response do
  it ".build" do
    expect(Api::Response.build).to eq({})
  end
end
