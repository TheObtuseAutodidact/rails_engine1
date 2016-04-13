require 'rails_helper'

RSpec.describe "Transactions API" do
  describe "GET /api/v1/transactions/:id/invoice" do
    it "returns associated invoice" do

      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}/invoice", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
    end
  end
end
