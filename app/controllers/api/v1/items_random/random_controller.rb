class Api::V1::ItemsRandom::RandomController < ApplicationController
  respond_to :json
  def show
    respond_with Item.order("RANDOM()").first
  end
end
