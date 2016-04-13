class Api::V1::Transactions::TransactionsFind::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.where(transaction_params)
  end
  def show
    # binding.pry
    respond_with Transaction.find_by(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result)
  end
end
