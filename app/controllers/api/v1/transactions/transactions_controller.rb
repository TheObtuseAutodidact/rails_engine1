class Api::V1::Transactions::TransactionsController < ApplicationController
  respond_to :json
  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end
end
