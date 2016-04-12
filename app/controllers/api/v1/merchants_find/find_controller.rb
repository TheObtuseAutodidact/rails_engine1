class Api::V1::MerchantsFind::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.where(merchant_params)
  end

  def show
    respond_with Merchant.find_by(merchant_params)
  end

  private

    def merchant_params
      params.permit(:id, :name)
    end
end
