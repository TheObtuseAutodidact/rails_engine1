class Api::V1::Invoices::InvoicesFind::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(invoice_params)
  end
  def show
    # binding.pry
    respond_with Invoice.find_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
