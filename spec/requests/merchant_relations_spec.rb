require 'rails_helper'

RSpec.describe "Merchants API" do
  describe "GET /api/v1/merchants/:id/items" do
    it "returns all merchant's items" do

      merch1 = create(:merchant, name: "Merch 1")
      create(:merchant, name: "Merch 2")

      get "/api/v1/merchants/#{merch1.id}/items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
      #
      # body = JSON.parse(response.body)
      #
      # merchant_names = body.map { |merchant| merchant["name"] }
      #
      # expect(merchant_names).to match_array(["Merch 1", "Merch 2"])
    end
  end

  describe "GET /api/v1/merchants/:id/invoices" do
    it "returns all merchant's invoices" do

      merch1 = create(:merchant, name: "Merch 1")
      create(:merchant, name: "Merch 2")

      get "/api/v1/merchants/#{merch1.id}/invoices", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

end
