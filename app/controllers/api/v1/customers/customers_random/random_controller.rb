class Api::V1::Customers::CustomersRandom::RandomController < ApplicationController
  respond_to :json
  def show
    respond_with Customer.order("RANDOM()").first
  end
end
