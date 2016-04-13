require 'rails_helper'

RSpec.describe "Invoices API" do
  describe "GET /api/v1/invoices/:id/transactions" do
    it "returns all invoice's transactions" do

      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}/transactions", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/invoices/:id/invoice_items" do
    it "returns all invoice's invoice_items" do

      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}/invoice_items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/invoices/:id/items" do
    it "returns all invoice's items" do

      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}/items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/invoices/:id/customer" do
    it "returns associated customer" do

      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}/customer", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/invoices/:id/merchant" do
    it "returns associated merchant" do

      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}/merchant", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end


end
