require "rails_helper"

RSpec.describe ConversationMessagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conversation_messages").to route_to("conversation_messages#index")
    end

    it "routes to #show" do
      expect(:get => "/conversation_messages/1").to route_to("conversation_messages#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conversation_messages").to route_to("conversation_messages#create")
    end

    it "routes to #update" do
      expect(:put => "/conversation_messages/1").to route_to("conversation_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conversation_messages/1").to route_to("conversation_messages#destroy", :id => "1")
    end

  end
end
