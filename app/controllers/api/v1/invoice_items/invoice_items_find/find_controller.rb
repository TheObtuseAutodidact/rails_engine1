class Api::V1::InvoiceItems::InvoiceItemsFind::FindController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end
  def show
    # binding.pry
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end
end
