require 'rails_helper'

RSpec.describe "Customers API" do
  describe "GET /api/v1/customers.json" do
    it "returns all customers" do

      customer = create(:customer)
      create(:customer, first_name: "Jane", last_name: "Doe")

      get "/api/v1/customers.json", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      customer_names = body.map { |customer| customer["first_name"] }

      expect(customer_names).to match_array(["#{customer.first_name}", "Jane"])
    end
  end


  describe "GET /api/v1/customers/2.json" do
    it "returns a single merchant" do
      customer1 = create(:customer)
      customer2 = create(:customer, first_name: "Jane")

      get "/api/v1/customers/#{customer2.id}.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to_not include("#{customer1.first_name}")
      expect(body.values).to include("Jane")
    end
  end

  describe "GET /api/v1/customers/find?id=2" do
    it "returns finds and returns customer by id" do
      customer1 = create(:customer)
      customer2 = create(:customer, first_name: "Jane")
      customer3 = create(:customer, first_name: "George")

      get "/api/v1/customers/find?id=#{customer2.id}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include("#{customer2.first_name}")
      expect(body.values).to_not include("#{customer1.first_name}")
      expect(body.values).to_not include("#{customer3.first_name}")
    end
  end

  describe "GET /api/v1/customers/find?first_name=Merch 2" do
    it "returns finds and returns customer by name" do
      customer1 = create(:customer)
      customer2 = create(:customer, first_name: "Jane")
      customer3 = create(:customer, first_name: "George")

      get "/api/v1/customers/find?first_name=#{customer2.first_name}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body.values).to include("#{customer2.first_name}")
      expect(body.values).to_not include("#{customer1.first_name}")
      expect(body.values).to_not include("#{customer3.first_name}")
    end
  end

  describe "GET /api/v1/customers/find_all?first_name=Merch 2" do
    it "finds and returns all customer with searched name" do
      create(:customer, first_name: "John")
      customer1 = create(:customer, first_name: "Jane")
      customer2 = create(:customer, first_name: "Jane")
      create(:customer, first_name: "Bill")

      get "/api/v1/customers/find_all?first_name=#{customer1.first_name}" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      customer_names = body.map { |customer| customer["first_name"] }

      expect(customer_names).to match_array(["#{customer1.first_name}", "#{customer2.first_name}"])

    end
  end

  describe "GET /api/v1/customers/random.json" do
    it "returns a random customer" do
      create(:customer, first_name: "Larry")
      customer1 = create(:customer, first_name: "Moe")
      customer2 = create(:customer, first_name: "Curly")
      create(:customer, first_name: "Shemp")

      get "/api/v1/customers/random.json" , {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body["first_name"]).to_not be_nil

    end
  end
end
