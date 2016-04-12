class Api::V1::Customers::CustomersFind::FindController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.where(customer_params)
  end

  def show
    respond_with Customer.find_by(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name)
  end
end
