require 'rails_helper'

RSpec.describe "Items API" do
  describe "GET /api/v1/items.json" do
    it "returns all items" do

      item = create(:item)
      create(:item, name: "Merch 2", description: "other item")

      get "/api/v1/items.json", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      item_names = body.map { |item| item["name"] }

      expect(item_names).to match_array(["#{item.name}", "Merch 2"])
    end
  end


  # describe "GET /api/v1/merchants/2.json" do
  #   it "returns a single merchant" do
  #     create(:merchant, name: "Merch 1")
  #     merchant = create(:merchant, name: "Merch 2")
  #
  #     get "/api/v1/merchants/#{merchant.id}.json" , {}, { "Accept" => "application/json" }
  #
  #     expect(response.status).to eq(200)
  #
  #     body = JSON.parse(response.body)
  #
  #     expect(body.values).to_not include("Merch 1")
  #     expect(body.values).to include("Merch 2")
  #   end
  # end
  #
  # describe "GET /api/v1/merchants/find?id=2" do
  #   it "returns finds and returns merchant by id" do
  #     create(:merchant, name: "Merch 1")
  #     merchant = create(:merchant, name: "Merch 2")
  #     create(:merchant, name: "Merch 3")
  #
  #     get "/api/v1/merchants/find?id=#{merchant.id}" , {}, { "Accept" => "application/json" }
  #
  #     expect(response.status).to eq(200)
  #
  #     body = JSON.parse(response.body)
  #
  #     expect(body.values).to include("Merch 2")
  #     expect(body.values).to_not include("Merch 1")
  #     expect(body.values).to_not include("Merch 3")
  #   end
  # end
  #
  # describe "GET /api/v1/merchants/find?name=Merch 2" do
  #   it "returns finds and returns merchant by name" do
  #     create(:merchant, name: "Merch 1")
  #     merchant = create(:merchant, name: "Merch 2")
  #     create(:merchant, name: "Merch 3")
  #
  #     get "/api/v1/merchants/find?name=#{merchant.name}" , {}, { "Accept" => "application/json" }
  #
  #     expect(response.status).to eq(200)
  #
  #     body = JSON.parse(response.body)
  #
  #     expect(body.values).to include("Merch 2")
  #     expect(body.values).to_not include("Merch 1")
  #     expect(body.values).to_not include("Merch 3")
  #   end
  # end
  #
  # describe "GET /api/v1/merchants/find_all?name=Merch 2" do
  #   it "finds and returns all merchant with searched name" do
  #     create(:merchant, name: "Merch 1")
  #     merchant1 = create(:merchant, name: "Merch 2")
  #     merchant2 = create(:merchant, name: "Merch 2")
  #     create(:merchant, name: "Merch 3")
  #
  #     get "/api/v1/merchants/find_all?name=#{merchant1.name}" , {}, { "Accept" => "application/json" }
  #
  #     expect(response.status).to eq(200)
  #
  #     body = JSON.parse(response.body)
  #
  #     merchant_names = body.map { |merchant| merchant["name"] }
  #
  #     expect(merchant_names).to match_array(["Merch 2", "Merch 2"])
  #
  #   end
  # end
  #
  # describe "GET /api/v1/merchants/random.json" do
  #   it "returns a random merchant" do
  #     create(:merchant, name: "Merch 1")
  #     merchant1 = create(:merchant, name: "Merch 2")
  #     merchant2 = create(:merchant, name: "Merch 3")
  #     create(:merchant, name: "Merch 4")
  #
  #     get "/api/v1/merchants/random.json" , {}, { "Accept" => "application/json" }
  #
  #     expect(response.status).to eq(200)
  #
  #     body = JSON.parse(response.body)
  #
  #     expect(body["name"]).to_not be_nil
  #
  #   end
  # end
  #
  #
  #
  #

end
