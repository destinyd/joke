require "spec_helper"

describe JokesController do
  describe "routing" do

    it "routes to #index" do
      get("/jokes").should route_to("jokes#index")
    end

    it "routes to #new" do
      get("/jokes/new").should route_to("jokes#new")
    end

    it "routes to #show" do
      get("/jokes/1").should route_to("jokes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jokes/1/edit").should route_to("jokes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jokes").should route_to("jokes#create")
    end

    it "routes to #update" do
      put("/jokes/1").should route_to("jokes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jokes/1").should route_to("jokes#destroy", :id => "1")
    end

  end
end
