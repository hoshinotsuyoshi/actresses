require 'spec_helper'

describe "SimilarActresses" do
  describe "GET /similar_actresses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get similar_actresses_path
      response.status.should be(200)
    end
  end
end
