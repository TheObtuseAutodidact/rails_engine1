require 'rails_helper'

RSpec.describe "Invoice API" do
  describe "GET /api/v1/invoices.json" do
    it "returns all invoices" do
      # merchant = create(:merchant)
      # customer1 = create(:customer)
      # customer2 = create(:customer)
      invoice1 = create(:invoice) #, customer: "#{customer1.id}", merchant: "#{merchant.id}")
      invoice2 = create(:invoice) #, customer: "#{customer2.id}", merchant: "#{merchant.id}", status: "shipped")

      get "/api/v1/invoices.json", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      invoice_names = body.map { |invoice| invoice["id"] }

      expect(invoice_names).to match_array(["#{invoice1.id}".to_i, "#{invoice2.id}".to_i])
    end
  end


  describe "GET /api/v1/invoices/2.json" do
    it "returns a single merchant" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)

      get "/api/v1/invoices/#{invoice2.id}.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to_not include("#{invoice1.id}".to_i)
      expect(body.values).to include("#{invoice2.id}".to_i)
    end
  end

  describe "GET /api/v1/invoices/find?id=2" do
    it "returns finds and returns invoice by id" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice2.id}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)



      expect(body.values).to include(invoice2.id)
      expect(body.values).to_not include(invoice1.id)
      expect(body.values).to_not include(invoice3.id)
    end
  end

  describe "GET /api/v1/invoices/find?status=shipped" do
    it "returns finds and returns invoice by name" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: "Shipped")
      invoice3 = create(:invoice)

      get "/api/v1/invoices/find?status=#{invoice2.status}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include(invoice2.id)
      expect(body.values).to_not include(invoice1.id)
      expect(body.values).to_not include(invoice3.id)
    end
  end

  describe "GET /api/v1/invoices/find_all?status=shipped" do
    it "finds and returns all invoice with searched name" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: "shipped")
      invoice3 = create(:invoice)
      invoice4 = create(:invoice, status: "shipped")

      get "/api/v1/invoices/find_all?status=shipped" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      invoice_names = body.map { |invoice| invoice["status"] }

      expect(invoice_names).to match_array(["#{invoice2.status}", "#{invoice4.status}"])

    end
  end

  describe "GET /api/v1/invoices/random.json" do
    it "returns a random invoice" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: "shipped")
      invoice3 = create(:invoice)
      invoice4 = create(:invoice, status: "shipped")

      get "/api/v1/invoices/random.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body["id"]).to_not be_nil

    end
  end
end
