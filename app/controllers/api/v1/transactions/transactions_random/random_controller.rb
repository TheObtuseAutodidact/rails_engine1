class Api::V1::Transactions::TransactionsRandom::RandomController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.order("RANDOM()").first
  end
end
