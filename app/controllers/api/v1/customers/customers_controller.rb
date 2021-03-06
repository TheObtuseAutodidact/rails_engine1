class Api::V1::Customers::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end
end
