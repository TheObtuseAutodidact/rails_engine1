class Api::V1::InvoiceItems::InvoiceItemsRandom::RandomController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.order("RANDOM()").first
  end
end
