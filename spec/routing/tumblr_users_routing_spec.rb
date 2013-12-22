require "spec_helper"

describe TumblrUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/tumblr_users").should route_to("tumblr_users#index")
    end

    it "routes to #new" do
      get("/tumblr_users/new").should route_to("tumblr_users#new")
    end

    it "routes to #show" do
      get("/tumblr_users/1").should route_to("tumblr_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tumblr_users/1/edit").should route_to("tumblr_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tumblr_users").should route_to("tumblr_users#create")
    end

    it "routes to #update" do
      put("/tumblr_users/1").should route_to("tumblr_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tumblr_users/1").should route_to("tumblr_users#destroy", :id => "1")
    end

  end
end
