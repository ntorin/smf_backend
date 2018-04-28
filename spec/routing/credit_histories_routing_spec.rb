require "rails_helper"

RSpec.describe CreditHistoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/credit_histories").to route_to("credit_histories#index")
    end

    it "routes to #show" do
      expect(:get => "/credit_histories/1").to route_to("credit_histories#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/credit_histories").to route_to("credit_histories#create")
    end

    it "routes to #update" do
      expect(:put => "/credit_histories/1").to route_to("credit_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/credit_histories/1").to route_to("credit_histories#destroy", :id => "1")
    end

  end
end
