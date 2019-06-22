class TransactionController < ApplicationController
  def index
    @transactions = current_user.transactions
  end

  def create
    dishes = JSON.parse(params[:dishes])
  end
end
