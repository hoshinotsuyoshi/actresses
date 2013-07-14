require "spec_helper"

describe SimilarActressesController do
  describe "routing" do

    it "routes to #index" do
      get("/similar_actresses").should route_to("similar_actresses#index")
    end

    it "routes to #new" do
      get("/similar_actresses/new").should route_to("similar_actresses#new")
    end

    it "routes to #show" do
      get("/similar_actresses/1").should route_to("similar_actresses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/similar_actresses/1/edit").should route_to("similar_actresses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/similar_actresses").should route_to("similar_actresses#create")
    end

    it "routes to #update" do
      put("/similar_actresses/1").should route_to("similar_actresses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/similar_actresses/1").should route_to("similar_actresses#destroy", :id => "1")
    end

  end
end
