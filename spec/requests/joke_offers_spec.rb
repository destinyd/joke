require 'spec_helper'

describe "JokeOffers" do
  describe "GET /joke_offers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get joke_offers_path
      response.status.should be(200)
    end
  end
end
