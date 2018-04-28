require 'rails_helper'

RSpec.describe "GrapevineMessages", :type => :request do
  describe "GET /grapevine_messages" do
    it "works! (now write some real specs)" do
      get grapevine_messages_path
      expect(response.status).to be(200)
    end
  end
end
