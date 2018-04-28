require "rails_helper"

RSpec.describe AnonymousProfilesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/anonymous_profiles").to route_to("anonymous_profiles#index")
    end

    it "routes to #show" do
      expect(:get => "/anonymous_profiles/1").to route_to("anonymous_profiles#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/anonymous_profiles").to route_to("anonymous_profiles#create")
    end

    it "routes to #update" do
      expect(:put => "/anonymous_profiles/1").to route_to("anonymous_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/anonymous_profiles/1").to route_to("anonymous_profiles#destroy", :id => "1")
    end

  end
end
