require "spec_helper"

describe ActressesController do
  describe "routing" do

    it "routes to #index" do
      get("/actresses").should route_to("actresses#index")
    end

    it "routes to #new" do
      get("/actresses/new").should route_to("actresses#new")
    end

    it "routes to #show" do
      get("/actresses/1").should route_to("actresses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/actresses/1/edit").should route_to("actresses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/actresses").should route_to("actresses#create")
    end

    it "routes to #update" do
      put("/actresses/1").should route_to("actresses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/actresses/1").should route_to("actresses#destroy", :id => "1")
    end

  end
end
