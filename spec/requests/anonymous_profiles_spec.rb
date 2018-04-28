require 'rails_helper'

RSpec.describe "AnonymousProfiles", :type => :request do
  before(:each) do
    @current_user = FactoryBot.create(:user)
    login
    @auth_params = get_auth_params_from_login_response_headers(response)
  end

  describe "GET /anonymous_profiles" do
    it "works! (now write some real specs)" do
      get anonymous_profiles_path, headers: @auth_params
      expect(response.status).to be(200)
    end
  end
end
