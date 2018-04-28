require 'rails_helper'

RSpec.describe "Follows", :type => :request do
  describe "GET /follows" do
    it "works! (now write some real specs)" do
      get follows_path
      expect(response.status).to be(200)
    end
  end
end
