require 'rails_helper'

RSpec.describe "ConversationMessages", :type => :request do
  describe "GET /conversation_messages" do
    it "works! (now write some real specs)" do
      get conversation_messages_path
      expect(response.status).to be(200)
    end
  end
end
