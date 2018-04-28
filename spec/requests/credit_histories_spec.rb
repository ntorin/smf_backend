require 'rails_helper'

RSpec.describe "CreditHistories", :type => :request do
  describe "GET /credit_histories" do
    it "works! (now write some real specs)" do
      get credit_histories_path
      expect(response.status).to be(200)
    end
  end
end
