require 'rails_helper'

RSpec.describe "InvoiceItems API" do
  describe "GET /api/v1/invoice_items/:id/invoice" do
    it "returns associated invoice" do

      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end

    describe "GET /api/v1/invoice_items/:id/item" do
      it "returns associated item" do

        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/#{invoice_item.id}/item", {}, { "Accept" => "application/json" }

        expect(response.status).to eq(200)
      end
    end

end
