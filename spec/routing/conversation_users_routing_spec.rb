require "rails_helper"

RSpec.describe ConversationUsersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conversation_users").to route_to("conversation_users#index")
    end

    it "routes to #show" do
      expect(:get => "/conversation_users/1").to route_to("conversation_users#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conversation_users").to route_to("conversation_users#create")
    end

    it "routes to #update" do
      expect(:put => "/conversation_users/1").to route_to("conversation_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conversation_users/1").to route_to("conversation_users#destroy", :id => "1")
    end

  end
end
