require 'rails_helper'

RSpec.describe "Customers API" do
  describe "GET /api/v1/customers/:id/invoices" do
    it "returns associated invoices" do

      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}/invoices", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

  describe "GET /api/v1/customers/:id/transactions" do
    it "returns associated transactions" do

      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}/transactions", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end
end
