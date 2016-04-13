require 'rails_helper'

RSpec.describe "InvoiceItems API" do
  describe "GET /api/v1/invoice_items.json" do
    it "returns all invoice_items" do
      invoice_item1 = create(:invoice_item) #, customer: "#{customer1.id}", merchant: "#{merchant.id}")
      invoice_item2 = create(:invoice_item) #, customer: "#{customer2.id}", merchant: "#{merchant.id}", status: "shipped")

      get "/api/v1/invoice_items.json", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      invoice_item_names = body.map { |invoice_item| invoice_item["id"] }

      expect(invoice_item_names).to match_array(["#{invoice_item1.id}".to_i, "#{invoice_item2.id}".to_i])
    end
  end

  describe "GET /api/v1/invoice_items/2.json" do
    it "returns a single merchant" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item2.id}.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to_not include("#{invoice_item1.id}".to_i)
      expect(body.values).to include("#{invoice_item2.id}".to_i)
    end
  end

  describe "GET /api/v1/invoice_items/find?id=2" do
    it "returns finds and returns invoice_item by id" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item)
      invoice_item3 = create(:invoice_item)

      get "/api/v1/invoice_items/find?id=#{invoice_item2.id}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)



      expect(body.values).to include(invoice_item2.id)
      expect(body.values).to_not include(invoice_item1.id)
      expect(body.values).to_not include(invoice_item3.id)
    end
  end

  describe "GET /api/v1/invoice_items/find?unit_price=1000" do
    it "returns finds and returns invoice_item by name" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, unit_price: 1000)
      invoice_item3 = create(:invoice_item)

      get "/api/v1/invoice_items/find?unit_price=#{invoice_item2.unit_price}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include(invoice_item2.id)
      expect(body.values).to_not include(invoice_item1.id)
      expect(body.values).to_not include(invoice_item3.id)
    end
  end

  describe "GET /api/v1/invoice_items/find_all?unit_price=1000" do
    it "finds and returns all invoice_item with searched name" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, unit_price: 1000)
      invoice_item3 = create(:invoice_item)
      invoice_item4 = create(:invoice_item, unit_price: 1000)

      get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item2.unit_price}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      invoice_item_names = body.map { |invoice_item| invoice_item["unit_price"] }

      expect(invoice_item_names).to match_array([invoice_item2.unit_price, invoice_item4.unit_price])

    end
  end

  describe "GET /api/v1/invoice_items/random.json" do
    it "returns a random invoice_item" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, unit_price: 1000)
      invoice_item3 = create(:invoice_item)
      invoice_item4 = create(:invoice_item, unit_price: 1000)

      get "/api/v1/invoice_items/random.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body["id"]).to_not be_nil

    end
  end
end
