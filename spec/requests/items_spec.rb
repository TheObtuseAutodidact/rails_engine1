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


  describe "GET /api/v1/items/2.json" do
    it "returns a single merchant" do
      create(:item, name: "Merch 1")
      item = create(:item, name: "Merch 2")

      get "/api/v1/items/#{item.id}.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to_not include("Merch 1")
      expect(body.values).to include("Merch 2")
    end
  end

  describe "GET /api/v1/items/find?id=2" do
    it "returns finds and returns item by id" do
      create(:item, name: "Merch 1")
      item = create(:item, name: "Merch 2")
      create(:item, name: "Merch 3")

      get "/api/v1/items/find?id=#{item.id}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include("Merch 2")
      expect(body.values).to_not include("Merch 1")
      expect(body.values).to_not include("Merch 3")
    end
  end

  describe "GET /api/v1/items/find?name=Merch 2" do
    it "returns finds and returns item by name" do
      create(:item, name: "Merch 1")
      item = create(:item, name: "Merch 2")
      create(:item, name: "Merch 3")

      get "/api/v1/items/find?name=#{item.name}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include("Merch 2")
      expect(body.values).to_not include("Merch 1")
      expect(body.values).to_not include("Merch 3")
    end
  end

  describe "GET /api/v1/items/find_all?name=Merch 2" do
    it "finds and returns all item with searched name" do
      create(:item, name: "Merch 1")
      item1 = create(:item, name: "Merch 2")
      item2 = create(:item, name: "Merch 2")
      create(:item, name: "Merch 3")

      get "/api/v1/items/find_all?name=#{item1.name}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      item_names = body.map { |item| item["name"] }

      expect(item_names).to match_array(["Merch 2", "Merch 2"])

    end
  end

  describe "GET /api/v1/items/random.json" do
    it "returns a random item" do
      create(:item, name: "Merch 1")
      item1 = create(:item, name: "Merch 2")
      item2 = create(:item, name: "Merch 3")
      create(:item, name: "Merch 4")

      get "/api/v1/items/random.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body["name"]).to_not be_nil

    end
  end





end
