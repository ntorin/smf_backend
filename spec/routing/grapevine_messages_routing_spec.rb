require "rails_helper"

RSpec.describe GrapevineMessagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grapevine_messages").to route_to("grapevine_messages#index")
    end

    it "routes to #show" do
      expect(:get => "/grapevine_messages/1").to route_to("grapevine_messages#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grapevine_messages").to route_to("grapevine_messages#create")
    end

    it "routes to #update" do
      expect(:put => "/grapevine_messages/1").to route_to("grapevine_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grapevine_messages/1").to route_to("grapevine_messages#destroy", :id => "1")
    end

  end
end
