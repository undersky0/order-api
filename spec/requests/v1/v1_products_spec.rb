require 'rails_helper'

RSpec.describe "V1::Products", :type => :request do
  describe "GET /v1_products" do
    it "works! (now write some real specs)" do
      get v1_products_path
      expect(response).to have_http_status(200)
    end
  end
end
