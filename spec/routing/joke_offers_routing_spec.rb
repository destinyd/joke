require "spec_helper"

describe JokeOffersController do
  describe "routing" do

    it "routes to #index" do
      get("/joke_offers").should route_to("joke_offers#index")
    end

    it "routes to #new" do
      get("/joke_offers/new").should route_to("joke_offers#new")
    end

    it "routes to #show" do
      get("/joke_offers/1").should route_to("joke_offers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/joke_offers/1/edit").should route_to("joke_offers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/joke_offers").should route_to("joke_offers#create")
    end

    it "routes to #update" do
      put("/joke_offers/1").should route_to("joke_offers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/joke_offers/1").should route_to("joke_offers#destroy", :id => "1")
    end

  end
end
