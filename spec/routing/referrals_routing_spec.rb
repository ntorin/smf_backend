require "rails_helper"

RSpec.describe ReferralsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/referrals").to route_to("referrals#index")
    end

    it "routes to #show" do
      expect(:get => "/referrals/1").to route_to("referrals#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/referrals").to route_to("referrals#create")
    end

    it "routes to #update" do
      expect(:put => "/referrals/1").to route_to("referrals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/referrals/1").to route_to("referrals#destroy", :id => "1")
    end

  end
end
