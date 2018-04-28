require 'rails_helper'

RSpec.describe "ConversationUsers", :type => :request do
  describe "GET /conversation_users" do
    it "works! (now write some real specs)" do
      get conversation_users_path
      expect(response.status).to be(200)
    end
  end
end
