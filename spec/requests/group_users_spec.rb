require 'rails_helper'

RSpec.describe "GroupUsers", :type => :request do
  describe "GET /group_users" do
    it "works! (now write some real specs)" do
      get group_users_path
      expect(response.status).to be(200)
    end
  end
end
