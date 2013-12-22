require 'spec_helper'

describe Api do
  it ".create! spec" do
    Api::Response.should_receive(:build).with(nil)
    Api.create!
  end
  it ".path_exist? spec" do
    Photo.stub_chain(:where,:size,:zero?,:!).and_return("ok")
    expect(Api.path_exist?("path")).to eq("ok")
  end
  it ".path_exist? returns false when not_exist_in_db" do
    Photo.delete_all
    expect(Api.path_exist?("path")).to eq(false)
  end
  it ".path_exist? returns true when exist_in_db" do
    Photo.delete_all
    Photo.create!(path: "path")
    expect(Api.path_exist?("path")).to eq(true)
    Photo.delete_all
  end
end
describe Api::Response do
  let(:not_exist_in_db) { {path: "not_exist_in_db" } }
  let(:exist_in_db) { {path: "exist_in_db" } }
  it ".build" do
    expect(Api::Response.build).to eq({})
  end
  it ".build('not_exist_in_db')" do
    Api.stub(:path_exist?).with(not_exist_in_db[:path]).and_return(false)
    expect(Api::Response.build not_exist_in_db).to eq({error: ""})
  end
  it ".build('exist_in_db')" do
    Api.stub(:path_exist?).with(exist_in_db[:path]).and_return(true)
    expect(Api::Response.build exist_in_db).to eq({error: "found"})
  end
end
