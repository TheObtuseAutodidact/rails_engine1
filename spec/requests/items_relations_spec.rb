require 'rails_helper'

RSpec.describe "Items API" do
  describe "GET /api/v1/items/:id/invoice_items" do
    it "returns associated invoice_items" do

      item = create(:item)

      get "/api/v1/items/#{item.id}/invoice_items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/items/:id/merchant" do
    it "returns associated merchant" do

      item = create(:item)

      get "/api/v1/items/#{item.id}/merchant", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end
end
