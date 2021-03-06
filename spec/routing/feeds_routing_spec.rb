require "rails_helper"

RSpec.describe FeedsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/feeds").to route_to("feeds#index")
    end

    it "routes to #show" do
      expect(:get => "/feeds/1").to route_to("feeds#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/feeds").to route_to("feeds#create")
    end

    it "routes to #update" do
      expect(:put => "/feeds/1").to route_to("feeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/feeds/1").to route_to("feeds#destroy", :id => "1")
    end

  end
end
