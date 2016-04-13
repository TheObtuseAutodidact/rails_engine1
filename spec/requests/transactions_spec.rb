require 'rails_helper'

RSpec.describe "Transactions API" do
  describe "GET /api/v1/transactions.json" do
    it "returns all transactions" do
      transaction1 = create(:transaction) #, customer: "#{customer1.id}", merchant: "#{merchant.id}")
      transaction2 = create(:transaction) #, customer: "#{customer2.id}", merchant: "#{merchant.id}", status: "shipped")

      get "/api/v1/transactions.json", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      transaction_names = body.map { |transaction| transaction["id"] }

      expect(transaction_names).to match_array(["#{transaction1.id}".to_i, "#{transaction2.id}".to_i])
    end
  end

  describe "GET /api/v1/transactions/2.json" do
    it "returns a single merchant" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction)

      get "/api/v1/transactions/#{transaction2.id}.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to_not include("#{transaction1.id}".to_i)
      expect(body.values).to include("#{transaction2.id}".to_i)
    end
  end

  describe "GET /api/v1/transactions/find?id=2" do
    it "returns finds and returns transaction by id" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction)
      transaction3 = create(:transaction)

      get "/api/v1/transactions/find?id=#{transaction2.id}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include(transaction2.id)
      expect(body.values).to_not include(transaction1.id)
      expect(body.values).to_not include(transaction3.id)
    end
  end

  describe "GET /api/v1/transactions/find?credit_card_number=54321" do
    it "returns finds and returns transaction by name" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction, credit_card_number: 54321)
      transaction3 = create(:transaction)

      get "/api/v1/transactions/find?credit_card_number=#{transaction2.credit_card_number}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include(transaction2.id)
      expect(body.values).to_not include(transaction1.id)
      expect(body.values).to_not include(transaction3.id)
    end
  end

  describe "GET /api/v1/transactions/find_all?unit_price=1000" do
    it "finds and returns all transaction with searched name" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction, credit_card_number: 54321)
      transaction3 = create(:transaction)
      transaction4 = create(:transaction, credit_card_number: 54321)

      get "/api/v1/transactions/find_all?credit_card_number=#{transaction2.credit_card_number}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      transaction_cc = body.map { |transaction| transaction["credit_card_number"] }

      expect(transaction_cc).to match_array([transaction2.credit_card_number, transaction4.credit_card_number])

    end
  end

  describe "GET /api/v1/transactions/random.json" do
    it "returns a random transaction" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction)
      transaction3 = create(:transaction)
      transaction4 = create(:transaction)

      get "/api/v1/transactions/random.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body["id"]).to_not be_nil

    end
  end
end
