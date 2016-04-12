class Api::V1::Merchants::MerchantsRandom::RandomController < ApplicationController
  respond_to :json
  def show
    respond_with Merchant.order("RANDOM()").first
  end
end
